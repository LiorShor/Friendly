//
//  MainCoordinator.swift
//  Friendly
//
//  Created by Lior Shor on 25/05/2023.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainViewController = MainViewController.instantiate()
        mainViewController.coordinator = self
        navigationController.pushViewController(mainViewController, animated: false)
    }
    
    func finish() {
        navigationController.topViewController?.dismiss(animated: true)
    }
    
    func openSettings() {
        let profileViewController = ProfileViewController.instantiate()
        profileViewController.coordinator = self
        navigationController.pushViewController(profileViewController, animated: true)
    }
}
