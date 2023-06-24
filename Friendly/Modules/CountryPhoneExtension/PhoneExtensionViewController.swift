//
//  PhoneExtensionViewController.swift
//  Friendly
//
//  Created by Lior Shor on 27/05/2023.
//

import UIKit
import SourceModel

protocol SelectedExtensionDelegate: AnyObject {
    func updateExtension(with number: String)
}
class PhoneExtensionViewController: UIViewController, Storyboarded {
    var backwardHandler: (([AnyHashable : Any]?) -> Void)?
    

    // MARK:- Properties

    private var presenter: PhoneExtensionPresenter!
    var dataSource: TableDataSource!
    var delegate: TableDelegate!
    weak var extensionDelegate: SelectedExtensionDelegate?
    
    // MARK:- Outlets

    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!

    // MARK:- LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    private func setupUI() {
        searchBar.delegate = self
    }

    func set(_ presenter: PhoneExtensionPresenter) {
        self.presenter = presenter
    }
}

extension PhoneExtensionViewController: PhoneExtensionViewable {
    
    func setupTableView(with modelCollection: ModelCollection?) {
        
        guard dataSource == nil else {
            delegate.update(modelCollection: modelCollection)
            dataSource.update(modelCollection: modelCollection)
            tableView.backgroundView = nil
            tableView.animateWithFade()
            return
        }
        
        delegate = TableDelegate(modelCollection: modelCollection)
        dataSource = TableDataSource(modelCollection: modelCollection, delegate: self)
        
        tableView.register(cellTypes: CountryExtensionCell.self)
        
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    func navigateBackWithData(_ extensionNumber: String) {
        extensionDelegate?.updateExtension(with: extensionNumber)
    }
}

extension PhoneExtensionViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.filterSearch(text: searchText)
    }
}

extension PhoneExtensionViewController: CountryExtesionDelegate {
    func didSelectExtension(_ extensionNumber: String) {
        presenter.selectedExtension(extensionNumber)
    }
}
