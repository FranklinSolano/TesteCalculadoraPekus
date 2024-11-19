//
//  LoginViewController.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 19/11/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    var screen: LoginScreen?
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavegationBar(animated: animated)
    }
    
    private func configNavegationBar(animated: Bool){
        self.navigationController?.setNavigationBarHidden(true, animated: animated)   // Esconde a Navigation Bar
    }

    
    private func configSetup(){
        configDelegates()
    }
    
    private func configDelegates(){
        screen?.delegate(delegate: self)
    }

}


extension LoginViewController: LoginScreenProtocol {
    func tappedLoginButton() {
        let vc = TabbarViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
