//
//  HomeScreen.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 18/11/24.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func actionPlusButton()
    func actionMinusButton()
    func actionMultiplicationButton()
    func actionDivisionButton()
    func actionCalculateButton()
    func alertError()
    func alertSuccess()
    func resultPlus()
    func resultMinus()
    func resultMultiply()
    func resultDivide()
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
        label.configLabel(text: HomeScreenEnum.welcome.rawValue, font: DesignerSystem.Fonts.fontBold, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var subtileLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: HomeScreenEnum.subtitle.rawValue, font: DesignerSystem.Fonts.fontSemiBold, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var valueOneLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: HomeScreenEnum.valueOne.rawValue, font: DesignerSystem.Fonts.fontDefault, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var valueOneTextField: UITextField = {
        let textField = CustomTextField(placeholder: HomeScreenEnum.placeholderValueOne.rawValue)
        return textField
    }()
    
    lazy var plusButton: UIButton = {
        let button = ButtonCustomOperators(image: HomeScreenEnum.plus.rawValue)
        button.addTarget(self, action: #selector(tappedPlusButton), for: .touchUpInside)
        return button
    }()
    
    lazy var minusButton: UIButton = {
        let button = ButtonCustomOperators(image: HomeScreenEnum.minus.rawValue)
        button.addTarget(self, action: #selector(tappedMinusButton), for: .touchUpInside)
        return button
    }()
    
    lazy var multiplicationButton: UIButton = {
        let button = ButtonCustomOperators(image: HomeScreenEnum.multiply.rawValue)
        button.addTarget(self, action: #selector(tappedMultiplicationButton), for: .touchUpInside)
        return button
    }()
    
    lazy var divisionButton: UIButton = {
        let button = ButtonCustomOperators(image: HomeScreenEnum.division.rawValue)
        button.addTarget(self, action: #selector(tappedDivisionButton), for: .touchUpInside)
        return button
    }()
    
    lazy var valueTwoLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: HomeScreenEnum.valueTwo.rawValue, font: DesignerSystem.Fonts.fontDefault, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var valueTwoTextField: UITextField = {
        let textField = CustomTextField(placeholder: HomeScreenEnum.placeholderValueTwo.rawValue)
        return textField
    }()
    
    lazy var calculeteButton: UIButton = {
        let button = ButtonCustomGeneric(title: HomeScreenEnum.calculate.rawValue, isEnabled: false, titleColor: .lightGray)
        button.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
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
        configElements()
        configConstraints()
        setupTapGesture()
    }
    
    private func configColor() {
        backgroundColor = DesignerSystem.Colors.secondaryColor
    }
    
    private func configElements() {
        addSubview(titleLabel)
        addSubview(subtileLabel)
        addSubview(valueOneLabel)
        addSubview(valueOneTextField)
        addSubview(plusButton)
        addSubview(minusButton)
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
            
            
            minusButton.topAnchor.constraint(equalTo: valueOneTextField.bottomAnchor,constant: 40),
            minusButton.centerXAnchor.constraint(equalTo: centerXAnchor,constant: -40),
            minusButton.heightAnchor.constraint(equalToConstant: 40),
            minusButton.widthAnchor.constraint(equalToConstant: 40),
            
            multiplicationButton.centerYAnchor.constraint(equalTo: minusButton.centerYAnchor),
            multiplicationButton.centerXAnchor.constraint(equalTo: centerXAnchor,constant: 40),
            multiplicationButton.heightAnchor.constraint(equalToConstant: 40),
            multiplicationButton.widthAnchor.constraint(equalToConstant: 40),
            
            plusButton.centerYAnchor.constraint(equalTo: minusButton.centerYAnchor),
            plusButton.trailingAnchor.constraint(equalTo: minusButton.leadingAnchor, constant: -40),
            plusButton.heightAnchor.constraint(equalToConstant: 40),
            plusButton.widthAnchor.constraint(equalToConstant: 40),
            
            divisionButton.centerYAnchor.constraint(equalTo: minusButton.centerYAnchor),
            divisionButton.leadingAnchor.constraint(equalTo: multiplicationButton.trailingAnchor, constant: 40),
            divisionButton.heightAnchor.constraint(equalToConstant: 40),
            divisionButton.widthAnchor.constraint(equalToConstant: 40),
            
            valueTwoLabel.topAnchor.constraint(equalTo: minusButton.bottomAnchor, constant: 40),
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
    
    private func setupTapGesture() {
          let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
          self.addGestureRecognizer(tapGesture)
      }
    
    func configSelectionButton() -> String{
        if plusButton.layer.borderColor ==  UIColor(red: 39/255, green: 68/255, blue: 122/255, alpha: 1).cgColor {
            minusButton.layer.borderColor = UIColor.clear.cgColor
            multiplicationButton.layer.borderColor = UIColor.clear.cgColor
            divisionButton.layer.borderColor = UIColor.clear.cgColor
            selectionButton = true
            delegate?.resultPlus()
            return "+"
        } else if minusButton.layer.borderColor == UIColor(red: 39/255, green: 68/255, blue: 122/255, alpha: 1).cgColor {
            plusButton.layer.borderColor = UIColor.clear.cgColor
            multiplicationButton.layer.borderColor = UIColor.clear.cgColor
            divisionButton.layer.borderColor = UIColor.clear.cgColor
            selectionButton = true
            delegate?.resultMinus()
            return "-"
        } else if multiplicationButton.layer.borderColor == UIColor(red: 39/255, green: 68/255, blue: 122/255, alpha: 1).cgColor {
            plusButton.layer.borderColor = UIColor.clear.cgColor
            minusButton.layer.borderColor = UIColor.clear.cgColor
            divisionButton.layer.borderColor = UIColor.clear.cgColor
            selectionButton = true
            delegate?.resultMultiply()
            return "*"
        } else if divisionButton.layer.borderColor == UIColor(red: 39/255, green: 68/255, blue: 122/255, alpha: 1).cgColor {
            plusButton.layer.borderColor = UIColor.clear.cgColor
            minusButton.layer.borderColor = UIColor.clear.cgColor
            multiplicationButton.layer.borderColor = UIColor.clear.cgColor
            selectionButton = true
            delegate?.resultDivide()
            return "/"
        }
        return ""
    }
    
    func configSelectionButton(button: UIButton) {
        let buttuns = [plusButton, minusButton, multiplicationButton, divisionButton]
            buttuns.forEach { $0.layer.borderColor = UIColor.clear.cgColor}
            button.layer.borderColor = DesignerSystem.Colors.primaryColor.cgColor
            selectionButton = true
    }
    
    func configButtonDisabled() {
        let isEnabled = !(valueOneTextField.text?.isEmpty ?? true) && !(valueTwoTextField.text?.isEmpty ?? true)
        calculeteButton.isEnabled = isEnabled
        calculeteButton.setTitleColor(isEnabled ? .white : .lightGray, for: .normal)
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
        plusButton.layer.borderColor = UIColor.clear.cgColor
        minusButton.layer.borderColor = UIColor.clear.cgColor
        multiplicationButton.layer.borderColor = UIColor.clear.cgColor
        divisionButton.layer.borderColor = UIColor.clear.cgColor
        selectionButton = false
        configButtonDisabled()
    }
    
    //MARK: - Actions-Buttons
    
    @objc func tappedPlusButton() {
        delegate?.actionPlusButton()
    }
    
    @objc func tappedMinusButton() {
        delegate?.actionMinusButton()
    }
    
    @objc func tappedMultiplicationButton() {
        delegate?.actionMultiplicationButton()
    }
    
    @objc func tappedDivisionButton() {
        delegate?.actionDivisionButton()
    }
    
    @objc func tappedCalculateButton() {
        delegate?.actionCalculateButton()
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
}

