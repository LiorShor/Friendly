//
//  PhoneExtensionPresenter.swift
//  Friendly
//
//  Created by Lior Shor on 27/05/2023.
//

import SourceModel

protocol PhoneExtensionViewable: class {
    func setupTableView(with modelCollection: ModelCollection?)
}

class PhoneExtensionPresenter: Presentable {

    // MARK:- Properties

    weak var view: PhoneExtensionViewable?
    weak var coordinator: PhoneExtensionCoordinating?
    var actions: PhoneExtensionActionable
    var parameters: PhoneExtensionParameterable

    // MARK:- Initialiser

    required init(actions: PhoneExtensionActionable, parameters: PhoneExtensionParameterable, view: PhoneExtensionViewable) {
        self.view = view
        self.actions = actions
        self.parameters = parameters
    }

    // MARK:- Functions

    func viewDidLoad() {
        // TODO: replace `nil` with data from paramaterable
        view?.setupTableView(with: nil)
    }
}
