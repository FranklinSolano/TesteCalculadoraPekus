//
//  Extension-StackView.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 20/11/24.
//

import UIKit

extension UIStackView{
    
    func configStackView(){
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillEqually
        self.backgroundColor = DesignerSystem.Colors.secondaryColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 2
        self.layer.borderColor = DesignerSystem.Colors.secondaryColor.cgColor
    }
    
}
