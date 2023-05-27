//
//  LoginPresenter.swift
//  Friendly
//
//  Created by Lior Shor on 26/05/2023.
//

import SourceModel

protocol LoginViewable: AnyObject {
    func setupTableView(with modelCollection: ModelCollection?)
}

class LoginPresenter: Presentable {

    // MARK:- Properties

    weak var view: LoginViewable?
    weak var coordinator: LoginCoordinating?
    var actions: LoginActionable
    var parameters: LoginParameterable

    // MARK:- Initialiser

    required init(actions: LoginActionable, parameters: LoginParameterable, view: LoginViewable) {
        self.view = view
        self.actions = actions
        self.parameters = parameters
    }

    // MARK:- Functions

    func viewDidLoad() {
        // TODO: replace `nil` with data from paramaterable
        view?.setupTableView(with: nil)
    }
    
    func onSignInWithPhoneTapped() {
        coordinator?.signInWithPhoneNumber()
    }
}
