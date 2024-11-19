//
//  Extension-Label.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 19/11/24.
//

import UIKit

extension UILabel {
    
    // Método para configurar texto e estilo
    func configLabel(text: String, font: UIFont, textColor: UIColor) {
        self.text = text
        self.font = font
        self.textColor = textColor
        self.numberOfLines = 0 // Permitir múltiplas linhas, se necessário
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .center
    }
}
