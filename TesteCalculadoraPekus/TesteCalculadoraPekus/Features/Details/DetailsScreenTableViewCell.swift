//
//  DetailsScreenTableViewCell.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 19/11/24.
//

import UIKit

class DetailsScreenTableViewCell: UITableViewCell {
    
    
    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "Id", font: DesignerSystem.Fonts.fontSmall, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var valueOneLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "Valor 1", font: DesignerSystem.Fonts.fontSmall, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var valueTwoLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "Valor 2", font: DesignerSystem.Fonts.fontSmall, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var operationLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "Operador", font: DesignerSystem.Fonts.fontSmall, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "Resultado", font: DesignerSystem.Fonts.fontSmall, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var dataLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "Data e Hora", font: DesignerSystem.Fonts.fontSmall, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal // Define o eixo como horizontal
        stackView.alignment = .fill   // Alinhamento das views dentro do StackView
        stackView.distribution = .fillEqually // Distribui o espaço de maneira igual entre as labels
        stackView.spacing = 5// Esp
        stackView.backgroundColor = DesignerSystem.Colors.secondaryColor
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 12
        stackView.layer.borderWidth = 2
        stackView.layer.borderColor = DesignerSystem.Colors.secondaryColor.cgColor
        stackView.addArrangedSubview(idLabel)
        stackView.addArrangedSubview(valueOneLabel)
        stackView.addArrangedSubview(operationLabel)
        stackView.addArrangedSubview(valueTwoLabel)
        stackView.addArrangedSubview(resultLabel)
        stackView.addArrangedSubview(dataLabel)
        return stackView
    }()
    

    static let identifier: String = "DetailsScreenTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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

    
    func configSetupCell(data: DetailsModel){
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
