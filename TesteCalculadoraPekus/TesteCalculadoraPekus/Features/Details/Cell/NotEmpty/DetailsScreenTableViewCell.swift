//
//  DetailsScreenTableViewCell.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 19/11/24.
//

import UIKit

class DetailsScreenTableViewCell: UITableViewCell {
    
    //MARK: - Elements
    
    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "", font: DesignerSystem.Fonts.fontSmall, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var valueOneLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "", font: DesignerSystem.Fonts.fontSmall, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var valueTwoLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "", font: DesignerSystem.Fonts.fontSmall, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var operationLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "", font: DesignerSystem.Fonts.fontSmall, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "", font: DesignerSystem.Fonts.fontSmall, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var dataLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "", font: DesignerSystem.Fonts.fontSmall, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.configStackView()
        stackView.addArrangedSubview(idLabel)
        stackView.addArrangedSubview(valueOneLabel)
        stackView.addArrangedSubview(operationLabel)
        stackView.addArrangedSubview(valueTwoLabel)
        stackView.addArrangedSubview(resultLabel)
        stackView.addArrangedSubview(dataLabel)
        return stackView
    }()
    
    //MARK: - Inicializador

    static let identifier: String = "DetailsScreenTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Other Methods
    
    func formatDoubleToString(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal // Define o estilo de formatação (pode ser .currency, .percent, etc.)
        formatter.minimumFractionDigits = 0 // Número mínimo de casas decimais
        formatter.maximumFractionDigits = 0 // Número máximo de casas decimais
        if let formattedValue = formatter.string(from: NSNumber(value: value)) {
            return formattedValue
        }
        return "\(value)"
    }

    func configSetupCellWithFixedData() {
        idLabel.text = "ID"
        valueOneLabel.text = "Valor 1"
        valueTwoLabel.text = "Valor 2"
        operationLabel.text = "Operação"
        resultLabel.text = "Resultado"
        dataLabel.text = "Data e Hora"
        stackView.layer.borderColor = DesignerSystem.Colors.secondaryColor.cgColor
        stackView.spacing = 5
    }
    
    func configSetupCellPopular(data: DetailsModel){
        idLabel.text = String(data.id ?? 0)
        valueOneLabel.text = data.valueOne
        valueTwoLabel.text = data.valueTwo
        operationLabel.text = data.operation
        resultLabel.text = formatDoubleToString(value: data.result ?? 0.0)
        dataLabel.text = data.data
        stackView.layer.borderColor = DesignerSystem.Colors.primaryColor.cgColor
        stackView.spacing = -7
    }
    
    private func configSetup(){
        selectionStyle = .none
        configElements()
        configConstraints()
    }
    
    private func configElements(){
        addSubview(stackView)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 2),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -2),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -5)
            
        ])
    }
}
