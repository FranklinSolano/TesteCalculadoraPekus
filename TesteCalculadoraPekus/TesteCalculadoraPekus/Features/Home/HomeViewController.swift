//
//  HomeViewController.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 18/11/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen: HomeScreen?
    var alert: Alert?
    var viewModel: HomeViewModel = HomeViewModel()
    var resultOperation: Double = 0.0
    
//MARK: - Inicializador
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configSetup()
        alert = Alert(controller: self)
        
    }
//MARK: - Other Methods
    
    func configSetup(){
        configDelegates()
    }
    
    func configDelegates(){
        screen?.configDelegate(delegate: self)
        screen?.delegate(delegate: self)
    }
}
 
//MARK: - Extension UITextFieldDelegate
extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        screen?.configButtonDisabled()
    }
}

//MARK: - Extension HomeScreenProtocol
extension HomeViewController: HomeScreenProtocol {
    func resultPlus() {
        let valueOne = Double(screen?.valueOneTextField.text ?? "") ?? 0.0
            let valueTwo = Double(screen?.valueTwoTextField.text ?? "") ?? 0.0
        resultOperation = viewModel.resultPlus(valueOne: valueOne, valueTwo: valueTwo)
    }
    
    func resultMinus() {
        let valueOne = Double(screen?.valueOneTextField.text ?? "") ?? 0.0
            let valueTwo = Double(screen?.valueTwoTextField.text ?? "") ?? 0.0
        resultOperation = viewModel.resultMinus(valueOne: valueOne, valueTwo: valueTwo)
    }
    
    func resultMultiply() {
        let valueOne = Double(screen?.valueOneTextField.text ?? "") ?? 0.0
            let valueTwo = Double(screen?.valueTwoTextField.text ?? "") ?? 0.0
        resultOperation = viewModel.resultMultiply(valueOne: valueOne, valueTwo: valueTwo)
    }
    
    func resultDivide() {
        let valueOne = Double(screen?.valueOneTextField.text ?? "") ?? 0.0
            let valueTwo = Double(screen?.valueTwoTextField.text ?? "") ?? 0.0
            resultOperation = viewModel.resultDivide(valueOne: valueOne, valueTwo: valueTwo)
    }
    
    func alertError() {
        alert?.getAlert(titulo: HomeViewControllerEnum.titleAlertError.rawValue, mensagem: HomeViewControllerEnum.messageAlertError.rawValue)
    }
    
    func alertSuccess() {
        alert?.getAlert(titulo: HomeViewControllerEnum.titleAlertSuccess.rawValue, mensagem: HomeViewControllerEnum.messageAlertSuccess.rawValue)
        viewModel.saveDataWithIncrement(value1: screen?.valueOneTextField.text ?? "", value2: screen?.valueTwoTextField.text ?? "",operation: screen?.configSelectionButton() ?? "" , result: resultOperation)
        screen?.sucessData()
    }
    
    func actionPlusButton() {
        screen?.configSelectionButton(button: screen?.plusButton ?? UIButton())
    }
    
    func actionMinusButton() {
        screen?.configSelectionButton(button: screen?.minusButton ?? UIButton())
    }
    
    func actionMultiplicationButton() {
        screen?.configSelectionButton(button: screen?.multiplicationButton ?? UIButton())
    }
    
    func actionDivisionButton() {
        screen?.configSelectionButton(button: screen?.divisionButton ?? UIButton())
    }
    
    func actionCalculateButton() {
        screen?.configButtonOperationSelection()
    }
}
