//
//  Extension-Label.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 19/11/24.
//

import UIKit

extension UILabel {
    
    func configLabel(text: String, font: UIFont, textColor: UIColor) {
        self.text = text
        self.font = font
        self.textColor = textColor
        self.numberOfLines = 0 
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .center
    }
}
