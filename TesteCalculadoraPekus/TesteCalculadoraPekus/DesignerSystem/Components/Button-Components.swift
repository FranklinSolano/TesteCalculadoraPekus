//
//  Button-Components.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 19/11/24.
//

import UIKit

class ButtonCustomOperators: UIButton {
    
    init(image: String) {
        super.init(frame: .zero)
        setupButton(image: image)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton(image: String){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setImage(UIImage(systemName: image), for: .normal)
        self.backgroundColor = .lightGray
        self.tintColor = .darkGray
        self.clipsToBounds = true
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.clear.cgColor
    }
}

class ButtonCustomCalculate: UIButton{
    
    init(title: String, isEnabled: Bool, titleColor: UIColor) {
        super.init(frame: .zero)
        setupButton(title: title, isEnabled: isEnabled, titleColor: titleColor)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton(title: String, isEnabled: Bool, titleColor: UIColor){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.backgroundColor = DesignerSystem.Colors.primaryColor
        self.clipsToBounds = true
        self.layer.cornerRadius = 12
        self.isEnabled = isEnabled
        self.setTitleColor(titleColor, for: .normal)
    }
    
    
}
