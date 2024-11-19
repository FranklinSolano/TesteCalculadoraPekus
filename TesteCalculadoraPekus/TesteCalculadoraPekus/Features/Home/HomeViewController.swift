//
//  HomeViewController.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 18/11/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configSetup()
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
}

extension HomeViewController: HomeScreenProtocol {
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
        print(#function)
    }
    
    
}
