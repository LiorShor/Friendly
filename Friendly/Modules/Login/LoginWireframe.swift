//
//  LoginWireframe.swift
//  Friendly
//
//  Created by Lior Shor on 26/05/2023.
//

import UIKit

class LoginWireframe {

    static func prepare(_ viewController: LoginViewController, actions: LoginActionable, parameters: LoginParameterable, coordinator: LoginCoordinating?) {
        let presenter = LoginPresenter(actions: actions, parameters: parameters, view: viewController)
        presenter.coordinator = coordinator
        viewController.set(presenter)
    }
}
