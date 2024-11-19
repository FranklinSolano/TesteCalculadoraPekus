//
//  HomeViewModel.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 19/11/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class HomeViewModel {
    
    func saveDataWithIncrement(value1: String, value2: String, operador: String, result: Double) {
        // Verifica se o usuário está logado
        guard let user = Auth.auth().currentUser else {
            print("Usuário não está logado")
            return
        }
        
        let uid = user.uid // Obtém o ID do usuário logado
        let db = Firestore.firestore()
        
        // Referência ao documento de controle de contador para o usuário
        let counterRef = db.collection("resultCounters").document(uid)

        // Inicia uma transação para garantir consistência no incremento do contador
        db.runTransaction({ (transaction, errorPointer) -> Any? in
            // Busca o documento de contador do usuário
            let counterDoc: DocumentSnapshot
            do {
                try counterDoc = transaction.getDocument(counterRef)
            } catch let error as NSError {
                errorPointer?.pointee = error
                return nil
            }

            // Se o documento não existir, inicialize o contador com 0
            let currentId = (counterDoc.exists) ? (counterDoc.data()?["currentId"] as? Int ?? 0) : 0
            let nextId = currentId + 1
            
            // Se o documento não existir, cria-o com currentId inicializado, senão, atualiza
            if counterDoc.exists {
                transaction.updateData(["currentId": nextId], forDocument: counterRef)
            } else {
                transaction.setData(["currentId": nextId], forDocument: counterRef)
            }
            
            // Captura a data e hora atual
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss" // Formato de data desejado
            let formattedDate = dateFormatter.string(from: date)
            
            // Criando o dicionário de dados a serem salvos com o novo `id`
            let dataToSave: [String: Any] = [
                "id": nextId,  // O próximo `id` sequencial
                "value1": value1,
                "value2": value2,
                "operador": operador,
                "result": result,
                "dataHora": formattedDate, // Data e hora no formato desejado
                "userID": uid // Associando o documento ao usuário logado
            ]
            
            // Adiciona os dados do resultado na coleção `result/{uid}/userData`
            let resultRef = db.collection("result").document(uid).collection("userData").document()
            transaction.setData(dataToSave, forDocument: resultRef)
            
            return nil
        }) { (object, error) in
            if let error = error {
                print("Erro ao realizar transação: \(error.localizedDescription)")
            } else {
                print("Dados salvos com sucesso!")
            }
        }
    }



    func resultPlus(valueOne: Double, valueTwo: Double) -> Double{
        let result = valueOne + valueTwo
        return result
    }
    
    func resultMinus(valueOne: Double, valueTwo: Double) -> Double{
        let result = valueOne - valueTwo
        return result
    }
    
    func resultMultiply(valueOne: Double, valueTwo: Double) -> Double{
        let result = valueOne * valueTwo
        return result
    }
    
    func resultDivide(valueOne: Double, valueTwo: Double) -> Double{
        let result = valueOne / valueTwo
        return result
    }
    
    
}
