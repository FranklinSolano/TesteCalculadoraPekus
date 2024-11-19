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
    
    func saveData(value1: String, value2: String, operador: String, result: Double) {
        // Verifica se o usuário está logado
        guard let user = Auth.auth().currentUser else {
            print("Usuário não está logado")
            return
        }
        
        let uid = user.uid // Obtém o ID do usuário logado
        let db = Firestore.firestore()
        
        // Captura a data e hora atual
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss" // Formato de data desejado
        let formattedDate = dateFormatter.string(from: date)
        
        // Criando o dicionário de dados a serem salvos
        let dataToSave: [String: Any] = [
            "id": UUID().uuidString,  // Gerando um ID único para cada entrada
            "value1": value1,
            "value2": value2,
            "operador": operador,
            "result": result,
            "dataHora": formattedDate, // Data e hora no formato desejado
            "userID": uid // Associando o documento ao usuário logado
        ]
        
        // Salvando os dados no Firestore dentro da coleção 'result' com o UID do usuário
        db.collection("result").document(uid).collection("userData").addDocument(data: dataToSave) { error in
            if let error = error {
                print("Erro ao salvar dados: \(error.localizedDescription)")
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
