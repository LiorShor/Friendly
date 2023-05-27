//
//  PhoneExtensionWireframe.swift
//  Friendly
//
//  Created by Lior Shor on 27/05/2023.
//

class PhoneExtensionWireframe {

    static func makeViewController() -> PhoneExtensionViewController {
      return UIStoryboard(name: PhoneExtensionViewController.self.identifier, bundle: nil).instantiate(viewController: PhoneExtensionViewController.self)
    }

    static func prepare(_ viewController: PhoneExtensionViewController, actions: PhoneExtensionActionable, parameters: PhoneExtensionParameterable, coordinator: PhoneExtensionCoordinating?) {
        let presenter = PhoneExtensionPresenter(actions: actions, parameters: parameters, view: viewController)
        presenter.coordinator = coordinator
        viewController.set(presenter)
    }
}
