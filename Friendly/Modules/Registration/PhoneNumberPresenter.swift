//
//  PhoneNumberPresenter.swift
//  Friendly
//
//  Created by Lior Shor on 26/05/2023.
//

protocol PhoneNumberViewable: AnyObject {

}

class PhoneNumberPresenter: Presentable {

    // MARK:- Properties

    weak var view: PhoneNumberViewable?
    weak var coordinator: PhoneNumberCoordinating?
    var actions: PhoneNumberActionable
    var parameters: PhoneNumberParameterable

    // MARK:- Initialiser

    required init(actions: PhoneNumberActionable, parameters: PhoneNumberParameterable, view: PhoneNumberViewable) {
        self.view = view
        self.actions = actions
        self.parameters = parameters
    }

    func viewDidLoad() {

    }
    
    func didTapExtensionButton() {
        coordinator?.presentPhoneExtensions()
    }
}
