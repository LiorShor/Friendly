//
//  MainCoordinator.swift
//  Friendly
//
//  Created by Lior Shor on 25/05/2023.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var actions: Actions
    var parameters: Parameters
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    required init(parameters: Parameters, actions: Actions, navigationController: UINavigationController) {
        self.parameters = parameters
        self.actions = actions
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

    func startPhoneRegistration() {
        let child = LoginCoordinator(parameters: parameters, actions: actions, navigationController: navigationController)
        childCoordinators.append(child)
        child.start()
    }
}
