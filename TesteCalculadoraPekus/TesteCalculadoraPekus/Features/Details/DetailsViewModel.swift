//
//  File.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 20/11/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class DetailsViewModel {
    var dataPopular: [DetailsModel] = []
    
    func fetchUserData(completion: @escaping ([DetailsModel]?, Error?) -> Void) {
        guard let user = Auth.auth().currentUser else {
            print("Usuário não está logado")
            completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Usuário não está logado"]))
            return
        }

        let uid = user.uid
        let db = Firestore.firestore()
        
        db.collection("result").document(uid).collection("userData")
            .order(by: "id")
            .getDocuments(source: .default) { (querySnapshot, error) in
                if let error = error {
                    print("Erro ao buscar dados: \(error.localizedDescription)")
                    completion(nil, error)
                } else {
                    var resultDataArray: [DetailsModel] = []
                    for document in querySnapshot?.documents ?? [] {
                        let data = document.data()
                        let resultData = DetailsModel(
                            id: data["id"] as? Int ?? 0,
                            valueOne: data["value1"] as? String ?? "",
                            valueTwo: data["value2"] as? String ?? "",
                            operation: data["operador"] as? String ?? "",
                            result: data["result"] as? Double ?? 0.0,
                            data: data["dataHora"] as? String ?? ""
                        )
                        resultDataArray.append(resultData)
                    }
                    completion(resultDataArray, nil)
                }
            }
    }
}
