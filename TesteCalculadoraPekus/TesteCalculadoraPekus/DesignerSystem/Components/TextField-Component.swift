//
//  File.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 19/11/24.
//

import UIKit

class CustomTextField: UITextField {

    // Inicializador para o text field
     init(placeholder: String) {
        super.init(frame: .zero)
        setupTextField(placeholder: placeholder)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // Configuração do text field
    private func setupTextField(placeholder: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.placeholder = placeholder
        self.backgroundColor = DesignerSystem.Colors.secondaryColor
        self.textColor = .black
        self.clipsToBounds = true
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 2
        self.layer.borderColor = DesignerSystem.Colors.primaryColor.cgColor
        self.keyboardType = .numberPad
        self.textAlignment = .center
    }
}
