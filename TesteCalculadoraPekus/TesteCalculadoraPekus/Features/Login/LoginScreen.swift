//
//  LoginScreen.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 19/11/24.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func tappedLoginButton()
}

class LoginScreen: UIView {
    
    weak var delegate: LoginScreenProtocol?
    func delegate(delegate:LoginScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var imageLogo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var loginButton: UIButton = {
        let button = ButtonCustomCalculate(title: "Login", isEnabled: true, titleColor: .white)
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configSetup(){
        configElements()
        configConstraints()
        backgroundColor = UIColor(red: 254/255, green: 254/255, blue: 254/255, alpha: 1)
    }
    
    func configElements(){
        addSubview(imageLogo)
        addSubview(loginButton)
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            
            imageLogo.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageLogo.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -50),
            imageLogo.heightAnchor.constraint(equalToConstant: 200),
            imageLogo.widthAnchor.constraint(equalToConstant: 200),
            
            loginButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -25),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    @objc func tappedLoginButton(){
        delegate?.tappedLoginButton()
    }
}
