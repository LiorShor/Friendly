//
//  MainViewController.swift
//  Friendly
//
//  Created by Lior Shor on 25/05/2023.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        coordinator?.showLogin()
        coordinator?.startPhoneRegistration()
        // Do any additional setup after loading the view.
    }
}

