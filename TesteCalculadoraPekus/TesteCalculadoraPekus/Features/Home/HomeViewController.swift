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
    func alertError() {
        alert?.getAlert(titulo: "Atenção", mensagem: "Selecione um operador para continuar")
    }
    
    func alertSuccess() {
        alert?.getAlert(titulo: "Sucesso", mensagem: "Dados Armezenados com sucesso")
        screen?.sucessData()
    }
    
    func actionAdditionButton() {
        screen?.configSelectionButtonAddtion()
    }
    
    func actionSubtractionButton() {
        screen?.configSelectionButtonSubtraction()
    }
    
    func actionMultiplicationButton() {
        screen?.configSelectionButtonMultiplication()
    }
    
    func actionDivisionButton() {
        screen?.configSelectionButtonDivision()
    }
    
    func actionCalculateButton() {
        screen?.configButtonOperationSelection()
    }
    
    
}
