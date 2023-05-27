//
//  PhoneExtensionViewController.swift
//  Friendly
//
//  Created by Lior Shor on 27/05/2023.
//

import UIKit
import SourceModel

class PhoneExtensionViewController: UIViewController, SourceTypePresentable {

    // MARK:- Properties

    private var presenter: PhoneExtensionPresenter!
    var dataSource: PhoneExtensionDataSource!
    var delegate: PhoneExtensionDelegate!

    // MARK:- Outlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK:- Typealias

    typealias DataSource = PhoneExtensionDataSource
    typealias Delegate = PhoneExtensionDelegate

    // MARK:- LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
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

            tableView.reloadData()
            return
        }

        delegate = PhoneExtensionDelegate(modelCollection: modelCollection)
        dataSource = PhoneExtensionDataSource(modelCollection: modelCollection)

        // Uncomment when registering XIB files
        // tableView.register(cellTypes: <#T##UITableViewCell#>.self, <#T##UITableViewCell#>.self)

        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
}
