//
//  LoginCoordinator.swift
//  Friendly
//
//  Created by Lior Shor on 26/05/2023.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator & PhoneNumberCoordinating & LoginCoordinating {
    var actions: Actions
    var parameters: Parameters
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    func start() {
        showLogin()
    }
    
    func finish() {
        childDidFinish(self)
    }
    
    required init(parameters: Parameters, actions: Actions, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.actions = actions
        self.parameters = parameters
    }

    func signInWithPhoneNumber() {
        let loginViewController = PhoneNumberViewController.instantiate()
        PhoneNumberWireframe.prepare(loginViewController, actions: actions, parameters: PhoneNumberParameters(), coordinator: self)
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    func showLogin() {
        let loginViewController = LoginViewController.instantiate()
        LoginWireframe.prepare(loginViewController, actions: actions, parameters: LoginParameters(), coordinator: self)
        navigationController.pushViewController(loginViewController, animated: true)
    }
}
