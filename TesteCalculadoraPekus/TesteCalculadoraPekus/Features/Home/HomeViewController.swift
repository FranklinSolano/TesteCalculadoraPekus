//
//  HomeViewController.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 18/11/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
