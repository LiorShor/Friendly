//
//  CountryExtensionCell.swift
//  Friendly
//
//  Created by Lior Shor on 27/05/2023.
//

import UIKit
import SourceModel

class CountryExtensionCell: UITableViewCell {

    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var extensionLabel: UILabel!
    
    override func prepareForReuse() {
        countryNameLabel.text = nil
        extensionLabel.text = nil
    }
}

extension CountryExtensionCell: Fillable {
    func fill(with model: SourceModel.Model?) {
        guard let model = model as? CountryExtension else { return }
        countryNameLabel.text = model.name
        extensionLabel.text = model.countryExtension
    }
}
