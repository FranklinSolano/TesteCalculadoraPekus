//
//  HomeScreen.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 18/11/24.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func actionAdditionButton()
    func actionSubtractionButton()
    func actionMultiplicationButton()
    func actionDivisionButton()
    func actionCalculateButton()
}

class HomeScreen: UIView {
    
    weak var delegate: HomeScreenProtocol?
    func delegate(delegate: HomeScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bem-vindo a Calculadora Pekus"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var subtileLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Informe os valores e sua operação abaixo"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var valueOneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Primerio valor"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var valueOneTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite aqui o primeiro valor"
        textField.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.8)
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1.5
        textField.keyboardType = .numberPad
        textField.layer.borderColor = UIColor.red.cgColor
        textField.textAlignment = .center
        return textField
    }()
    
    lazy var additionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = .lightGray
        button.tintColor = .darkGray
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.clear.cgColor
        button.addTarget(self, action: #selector(tappedAdditionButton), for: .touchUpInside)
        return button
    }()
    
    lazy var subtractionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.backgroundColor = .lightGray
        button.tintColor = .darkGray
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.clear.cgColor
        button.addTarget(self, action: #selector(tappedSubtractionButton), for: .touchUpInside)
        return button
    }()
    
    lazy var multiplicationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "multiply"), for: .normal)
        button.backgroundColor = .lightGray
        button.tintColor = .darkGray
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.clear.cgColor
        button.addTarget(self, action: #selector(tappedMultiplicationButton), for: .touchUpInside)
        return button
    }()
    
    lazy var divisionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "divide"), for: .normal)
        button.backgroundColor = .lightGray
        button.tintColor = .darkGray
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.clear.cgColor
        button.addTarget(self, action: #selector(tappedDivisionButton), for: .touchUpInside)
        return button
    }()
    
    lazy var valueTwoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Segundo valor"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var valueTwoTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite aqui o segundo valor"
        textField.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.8)
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.red.cgColor
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        return textField
    }()
    
    lazy var calculeteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular", for: .normal)
        button.backgroundColor = .red
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.red.cgColor
        button.addTarget(self, action: #selector(tappedCalculateutton), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSetup() {
        configColor()
        configLayout()
        configConstraints()
    }
    
    public func configDelegate(delegate: UITextFieldDelegate){
        valueOneTextField.delegate = delegate
        valueTwoTextField.delegate = delegate
    }
    
    private func configColor() {
        backgroundColor = .darkGray
    }
    
    private func configLayout() {
        addSubview(titleLabel)
        addSubview(subtileLabel)
        addSubview(valueOneLabel)
        addSubview(valueOneTextField)
        addSubview(additionButton)
        addSubview(subtractionButton)
        addSubview(multiplicationButton)
        addSubview(divisionButton)
        addSubview(valueTwoLabel)
        addSubview(valueTwoTextField)
        addSubview(calculeteButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -25),
            
            subtileLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            subtileLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            valueOneLabel.topAnchor.constraint(equalTo: subtileLabel.bottomAnchor, constant: 50),
            valueOneLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            valueOneTextField.topAnchor.constraint(equalTo: valueOneLabel.bottomAnchor,constant: 10),
            valueOneTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            valueOneTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            valueOneTextField.heightAnchor.constraint(equalToConstant: 50),
            
            
            subtractionButton.topAnchor.constraint(equalTo: valueOneTextField.bottomAnchor,constant: 40),
            subtractionButton.centerXAnchor.constraint(equalTo: centerXAnchor,constant: -40),
            subtractionButton.heightAnchor.constraint(equalToConstant: 40),
            subtractionButton.widthAnchor.constraint(equalToConstant: 40),
            
            multiplicationButton.centerYAnchor.constraint(equalTo: subtractionButton.centerYAnchor),
            multiplicationButton.centerXAnchor.constraint(equalTo: centerXAnchor,constant: 40),
            multiplicationButton.heightAnchor.constraint(equalToConstant: 40),
            multiplicationButton.widthAnchor.constraint(equalToConstant: 40),
            
            additionButton.centerYAnchor.constraint(equalTo: subtractionButton.centerYAnchor),
            additionButton.trailingAnchor.constraint(equalTo: subtractionButton.leadingAnchor, constant: -40),
            additionButton.heightAnchor.constraint(equalToConstant: 40),
            additionButton.widthAnchor.constraint(equalToConstant: 40),
            
            divisionButton.centerYAnchor.constraint(equalTo: subtractionButton.centerYAnchor),
            divisionButton.leadingAnchor.constraint(equalTo: multiplicationButton.trailingAnchor, constant: 40),
            divisionButton.heightAnchor.constraint(equalToConstant: 40),
            divisionButton.widthAnchor.constraint(equalToConstant: 40),
            
            valueTwoLabel.topAnchor.constraint(equalTo: subtractionButton.bottomAnchor, constant: 40),
            valueTwoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            valueTwoTextField.topAnchor.constraint(equalTo: valueTwoLabel.bottomAnchor,constant: 10),
            valueTwoTextField.leadingAnchor.constraint(equalTo: valueOneTextField.leadingAnchor),
            valueTwoTextField.trailingAnchor.constraint(equalTo: valueOneTextField.trailingAnchor),
            valueTwoTextField.heightAnchor.constraint(equalToConstant: 50),
            
            calculeteButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            calculeteButton.leadingAnchor.constraint(equalTo: valueOneTextField.leadingAnchor),
            calculeteButton.trailingAnchor.constraint(equalTo: valueOneTextField.trailingAnchor),
            calculeteButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            
        ])
    }
    
    func configSelectionButtonAddtion(){
        additionButton.layer.borderColor = UIColor.red.cgColor
        subtractionButton.layer.borderColor = UIColor.clear.cgColor
        multiplicationButton.layer.borderColor = UIColor.clear.cgColor
        divisionButton.layer.borderColor = UIColor.clear.cgColor
    }
    
    func configSelectionButtonSubtraction(){
        additionButton.layer.borderColor = UIColor.clear.cgColor
        subtractionButton.layer.borderColor = UIColor.red.cgColor
        multiplicationButton.layer.borderColor = UIColor.clear.cgColor
        divisionButton.layer.borderColor = UIColor.clear.cgColor
    }
    
    func configSelectionButtonMultiplication(){
        additionButton.layer.borderColor = UIColor.clear.cgColor
        subtractionButton.layer.borderColor = UIColor.clear.cgColor
        multiplicationButton.layer.borderColor = UIColor.red.cgColor
        divisionButton.layer.borderColor = UIColor.clear.cgColor
    }
    
    func configSelectionButtonDivision(){
        additionButton.layer.borderColor = UIColor.clear.cgColor
        subtractionButton.layer.borderColor = UIColor.clear.cgColor
        multiplicationButton.layer.borderColor = UIColor.clear.cgColor
        divisionButton.layer.borderColor = UIColor.red.cgColor
    }
    
    
    @objc func tappedAdditionButton() {
        delegate?.actionAdditionButton()
    }
    
    @objc func tappedSubtractionButton() {
        delegate?.actionSubtractionButton()
    }
    
    @objc func tappedMultiplicationButton() {
        delegate?.actionMultiplicationButton()
    }
    
    @objc func tappedDivisionButton() {
        delegate?.actionDivisionButton()
    }
    
    @objc func tappedCalculateutton() {
        delegate?.actionCalculateButton()
    }
}


//import SwiftUI
//
//// Preview para visualizar o LoginViewController
//struct PreviewController_Previews: PreviewProvider {
//    static var previews: some View {
//        PreviewViewControllerRepresentable()
//            .edgesIgnoringSafeArea(.all)
//    }
//}
//
//// UIViewControllerRepresentable para integrar UIKit ao SwiftUI
//struct PreviewViewControllerRepresentable: UIViewControllerRepresentable {
//    
//    func makeUIViewController(context: Context) -> UINavigationController {
//        // Cria o LoginViewController e o coloca dentro de um UINavigationController
//        let previewVC = HomeViewController()
//        let navigationController = UINavigationController(rootViewController: previewVC)
//        return navigationController
//    }
//    
//    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
//        // Atualizações podem ser feitas aqui, mas pode ser deixado vazio
//    }
//}
