//
//  LoginCoordinator.swift
//  Friendly
//
//  Created by Lior Shor on 26/05/2023.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator & PhoneNumberCoordinating & LoginCoordinating & PhoneExtensionCoordinating {
    
    var actions: Actions
    var parameters: Parameters
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var phoneNumberViewController: UIViewController?
    
    func start() {
        showLogin()
    }
    
    func finish() {
        childDidFinish(self)
        dismiss()
    }
    
    required init(parameters: Parameters, actions: Actions, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.actions = actions
        self.parameters = parameters
    }

    func signInWithPhoneNumber() {
        phoneNumberViewController = PhoneNumberViewController.instantiate()
        guard let phoneNumberViewController = phoneNumberViewController as? PhoneNumberViewController else { return }
        PhoneNumberWireframe.prepare(phoneNumberViewController, actions: actions, parameters: PhoneNumberParameters(), coordinator: self)
        navigationController.pushViewController(phoneNumberViewController, animated: true)
    }
    
    func showLogin() {
        let loginViewController = LoginViewController.instantiate()
        LoginWireframe.prepare(loginViewController, actions: actions, parameters: LoginParameters(), coordinator: self)
        navigationController.pushViewController(loginViewController, animated: true)
    }

    func presentPhoneExtensions() {
        let phoneExtensionViewController = PhoneExtensionViewController.instantiate()
        PhoneExtensionWireframe.prepare(phoneExtensionViewController, actions: actions, parameters: PhoneExtensionParameters(), coordinator: self)
        phoneExtensionViewController.extensionDelegate = phoneNumberViewController as? SelectedExtensionDelegate
        navigationController.present(phoneExtensionViewController, animated: true)
    }
}
