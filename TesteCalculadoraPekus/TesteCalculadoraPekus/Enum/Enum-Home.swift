//
//  Enum-Home.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 20/11/24.
//

import Foundation

enum HomeScreenEnum: String {
    case welcome = "Bem-vindo a Calculadora PEKUS"
    case subtitle = "Informe os valores e a operação desejada abaixo"
    case valueOne = "Primeiro valor"
    case placeholderValueOne = "Digite o primeiro valor"
    case valueTwo = "Segundo valor"
    case placeholderValueTwo = "Digite o segundo valor"
    case plus = "plus"
    case minus = "minus"
    case multiply = "multiply"
    case division = "divide"
    case calculate = "Calculate"
}

enum HomeViewControllerEnum: String {
    case titleAlertError = "Atenção"
    case messageAlertError = "Selecione um operador para continuar"
    case titleAlertSuccess = "Sucesso"
    case messageAlertSuccess = "Dados Armezenados com sucesso"
}
