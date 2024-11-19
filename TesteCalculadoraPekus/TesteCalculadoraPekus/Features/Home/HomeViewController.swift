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
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configSetup()
        alert = Alert(controller: self)
        
    }
    
    func configSetup(){
        configDelegates()
    }
    
    func configDelegates(){
        screen?.configDelegate(delegate: self)
        screen?.delegate(delegate: self)
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        screen?.configButtonDisabled()
    }
}

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
        alert?.getAlert(titulo: "Atenção", mensagem: "Selecione um operador para continuar")
    }
    
    func alertSuccess() {
        alert?.getAlert(titulo: "Sucesso", mensagem: "Dados Armezenados com sucesso")
       
        viewModel.saveDataWithIncrement(value1: screen?.valueOneTextField.text ?? "", value2: screen?.valueTwoTextField.text ?? "",operador: screen?.configSelectionButton() ?? "" , result: resultOperation)
        screen?.sucessData()
                
    }
    
    func actionAdditionButton() {
        screen?.configSelectionButton(button: screen?.additionButton ?? UIButton())
    }
    
    func actionSubtractionButton() {
        screen?.configSelectionButton(button: screen?.subtractionButton ?? UIButton())
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
