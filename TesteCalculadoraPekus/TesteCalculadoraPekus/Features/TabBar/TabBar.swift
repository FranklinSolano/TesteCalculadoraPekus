//
//  TabBar.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 19/11/24.
//

import UIKit

class TabbarViewController: UITabBarController {

    //MARK: - Inicializador
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabbarController()
    }
    
    //MARK: - Other Methods

    private func setupTabbarController(){
        
        let homeTabbar = HomeViewController()
        let DetailsViewController = DetailsViewController()
        
        setViewControllers([homeTabbar,DetailsViewController], animated: false)
        
        tabBar.backgroundColor = DesignerSystem.Colors.primaryColor
        tabBar.isTranslucent = false
        tabBar.barTintColor = DesignerSystem.Colors.secondaryColor
        
        guard let tabBarItem = tabBar.items else {return}
        
        tabBarItem[0].title = "Home"
        tabBarItem[0].image = UIImage(systemName: "house")
        
        tabBarItem[1].title = "Details"
        tabBarItem[1].image = UIImage(systemName: "equal.square")
    }
}
