//
//  PhoneNumberWireframe.swift
//  Friendly
//
//  Created by Lior Shor on 26/05/2023.
//

class PhoneNumberWireframe {

    static func prepare(_ viewController: PhoneNumberViewController, actions: PhoneNumberActionable, parameters: PhoneNumberParameterable, coordinator: PhoneNumberCoordinating?) {
    	let presenter = PhoneNumberPresenter(actions: actions, parameters: parameters, view: viewController)
        presenter.coordinator = coordinator
        viewController.set(presenter)
    }
}
