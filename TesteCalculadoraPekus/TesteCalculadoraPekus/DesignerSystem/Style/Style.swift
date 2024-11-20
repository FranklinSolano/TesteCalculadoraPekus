//
//  File.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 19/11/24.
//

import UIKit

public struct DesignerSystem {
    
    public struct Colors {
         static let primaryColor =  UIColor(red: 39/255, green: 68/255, blue: 122/255, alpha: 1)
         static let secondaryColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.8)
        static let thirdColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    }
    
    public struct Fonts {
        static let fontSmall = UIFont.systemFont(ofSize: 12,weight: .medium)
         static let fontDefault = UIFont.systemFont(ofSize: 16,weight: .regular)
        static let fontBold = UIFont.systemFont(ofSize: 25, weight: .bold)
        static let fontSemiBold = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
    }
   
}
