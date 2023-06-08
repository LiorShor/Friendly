//
//  PhoneExtensionPresenter.swift
//  Friendly
//
//  Created by Lior Shor on 27/05/2023.
//

import SourceModel

protocol PhoneExtensionViewable: AnyObject {
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
        actions.fetchCountries { [weak self] response, error in
            guard let items = response?.items else {
                // TODO: Add error popup
                return
            }
            self?.parameters.setCountries(items: items)
            self?.view?.setupTableView(with: self?.parameters.countriesCollection)
        }
    }
    
    func filterSearch(text: String) {
        if text == .empty {
            view?.setupTableView(with: parameters.countriesCollection)
        } else {
            view?.setupTableView(with: CountriesCollection(items: parameters.countriesCollection?.items.filter { $0.name?.contains(text) ?? false } ?? []))
        }
    }
}
