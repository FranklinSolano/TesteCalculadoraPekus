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
    func alertError()
    func alertSuccess()
}

class HomeScreen: UIView {
    
    weak var delegate: HomeScreenProtocol?
    func delegate(delegate: HomeScreenProtocol){
        self.delegate = delegate
    }
    
    var selectionButton: Bool = false
    
    //MARK: - Elements
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "Bem-vindo a Calculadora PEKUS", font: DesignerSystem.Fonts.fontBold, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var subtileLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "Informe os valores e a operação desejada abaixo", font: DesignerSystem.Fonts.fontSemiBold, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var valueOneLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "Primeiro valor", font: DesignerSystem.Fonts.fontDefault, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var valueOneTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Digite aqui o primeiro valor")
        return textField
    }()
    
    lazy var additionButton: UIButton = {
        let button = ButtonCustomOperators(image: "plus")
        button.addTarget(self, action: #selector(tappedAdditionButton), for: .touchUpInside)
        return button
    }()
    
    lazy var subtractionButton: UIButton = {
        let button = ButtonCustomOperators(image: "minus")
        button.addTarget(self, action: #selector(tappedSubtractionButton), for: .touchUpInside)
        return button
    }()
    
    lazy var multiplicationButton: UIButton = {
        let button = ButtonCustomOperators(image: "multiply")
        button.addTarget(self, action: #selector(tappedMultiplicationButton), for: .touchUpInside)
        return button
    }()
    
    lazy var divisionButton: UIButton = {
        let button = ButtonCustomOperators(image: "divide")
        button.addTarget(self, action: #selector(tappedDivisionButton), for: .touchUpInside)
        return button
    }()
    
    lazy var valueTwoLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "Segundo valor", font: DesignerSystem.Fonts.fontDefault, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var valueTwoTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Digite aqui o segundo valor")
        return textField
    }()
    
    lazy var calculeteButton: UIButton = {
        let button = ButtonCustomCalculate(title: "Calcular", isEnabled: false, titleColor: .lightGray)
        button.addTarget(self, action: #selector(tappedCalculateutton), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Inicializador

    override init(frame: CGRect) {
        super.init(frame: frame)
        configSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Other Methods
    
     func configDelegate(delegate: UITextFieldDelegate){
        valueOneTextField.delegate = delegate
        valueTwoTextField.delegate = delegate
    }
    
    private func configSetup() {
        configColor()
        configLayout()
        configConstraints()
        setupTapGesture()
    }
    
    private func configColor() {
        backgroundColor = DesignerSystem.Colors.secondaryColor
    }
    
    private func setupTapGesture() {
          let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
          self.addGestureRecognizer(tapGesture)
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
            subtileLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtileLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
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
            
            calculeteButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40),
            calculeteButton.leadingAnchor.constraint(equalTo: valueOneTextField.leadingAnchor),
            calculeteButton.trailingAnchor.constraint(equalTo: valueOneTextField.trailingAnchor),
            calculeteButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configSelectionButtonAddtion(){
        additionButton.layer.borderColor = UIColor(red: 39/255, green: 68/255, blue: 122/255, alpha: 1).cgColor
        subtractionButton.layer.borderColor = UIColor.clear.cgColor
        multiplicationButton.layer.borderColor = UIColor.clear.cgColor
        divisionButton.layer.borderColor = UIColor.clear.cgColor
        selectionButton = true
    }
    
    func configSelectionButtonSubtraction(){
        additionButton.layer.borderColor = UIColor.clear.cgColor
        subtractionButton.layer.borderColor = UIColor(red: 39/255, green: 68/255, blue: 122/255, alpha: 1).cgColor
        multiplicationButton.layer.borderColor = UIColor.clear.cgColor
        divisionButton.layer.borderColor = UIColor.clear.cgColor
        selectionButton = true
    }
    
    func configSelectionButtonMultiplication(){
        additionButton.layer.borderColor = UIColor.clear.cgColor
        subtractionButton.layer.borderColor = UIColor.clear.cgColor
        multiplicationButton.layer.borderColor = UIColor(red: 39/255, green: 68/255, blue: 122/255, alpha: 1).cgColor
        divisionButton.layer.borderColor = UIColor.clear.cgColor
        selectionButton = true
    }
    
    func configSelectionButtonDivision(){
        additionButton.layer.borderColor = UIColor.clear.cgColor
        subtractionButton.layer.borderColor = UIColor.clear.cgColor
        multiplicationButton.layer.borderColor = UIColor.clear.cgColor
        divisionButton.layer.borderColor = UIColor(red: 39/255, green: 68/255, blue: 122/255, alpha: 1).cgColor
        selectionButton = true
    }
    
    func configButtonDisabled(){
        let valueOne = valueOneTextField.text ?? ""
        let valueTwo = valueTwoTextField.text ?? ""
        
        if !valueOne.isEmpty && !valueTwo.isEmpty {
            calculeteButton.setTitleColor(.white, for: .normal)
            calculeteButton.isEnabled = true
        } else {
            calculeteButton.setTitleColor(.lightGray, for: .normal)
            calculeteButton.isEnabled = false
        }
    }
    
    func configButtonOperationSelection(){
        if selectionButton == false {
            delegate?.alertError()
        } else {
            delegate?.alertSuccess()
        }
    }
    
    func sucessData(){
        valueOneTextField.text = ""
        valueTwoTextField.text = ""
        additionButton.layer.borderColor = UIColor.clear.cgColor
        subtractionButton.layer.borderColor = UIColor.clear.cgColor
        multiplicationButton.layer.borderColor = UIColor.clear.cgColor
        divisionButton.layer.borderColor = UIColor.clear.cgColor
        selectionButton = false
        configButtonDisabled()
    }
    
    //MARK: - Actions-Buttons
    
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
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
}

