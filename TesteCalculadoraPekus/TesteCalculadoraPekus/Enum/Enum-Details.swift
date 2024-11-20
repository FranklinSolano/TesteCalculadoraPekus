//
//  Enum-Details.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 20/11/24.
//

import Foundation

enum DetailsScreenEnum: String{
    case title = "Dados de todas as operações"
}

enum DetailsScreenTableViewCellEnum: String {
    case id = "ID"
    case valueOne = "Valor 1"
    case valueTwo = "Valor 2"
    case result = "Resultado"
    case date = "Data e Hora"
    case operationType = "Operação"
    case identifier = "DetailsScreenTableViewCell"
}

enum DetailsIsEmptyTableViewCellEnum: String {
    case title = "Ainda não há nenhum resultado"
    case image = "hand.raised.app"
    case identifier = "DetailsIsEmptyTableViewCell"
}
