//
//  PhoneExtensionViewController.swift
//  Friendly
//
//  Created by Lior Shor on 27/05/2023.
//

import UIKit
import SourceModel

class PhoneExtensionViewController: UIViewController, Storyboarded {

    // MARK:- Properties

    private var presenter: PhoneExtensionPresenter!
    var dataSource: TableDataSource!
    var delegate: TableDelegate!
    
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
        dataSource = TableDataSource(modelCollection: modelCollection)
        
        tableView.register(cellTypes: CountryExtensionCell.self)
        
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
}

extension PhoneExtensionViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.filterSearch(text: searchText)
    }
}
