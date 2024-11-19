//
//  LoginViewModel.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 19/11/24.
//

import UIKit
import FirebaseAuth

protocol LoginViewModelProtocol: AnyObject{
    func sucess()
}

class LoginViewModel {
    
    weak var delegate: LoginViewModelProtocol?
    
    func setupDelegate(delegate: LoginViewModelProtocol){
        self.delegate = delegate
    }
    
    func loginFirebase(email: String , password: String){
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error == nil {
                self.delegate?.sucess()
            } 
        }
    }
}
