//
//  CountryExtensionCell.swift
//  Friendly
//
//  Created by Lior Shor on 27/05/2023.
//

import UIKit
import SourceModel

protocol CountryExtesionDelegate: AnyObject {
    func didSelectExtension(_ extensionNumber: String)
}

class CountryExtensionCell: UITableViewCell {

    @IBOutlet private weak var countryNameLabel: UILabel!
    @IBOutlet private weak var extensionLabel: UILabel!
    private weak var delegate: CountryExtesionDelegate?
    
    override func prepareForReuse() {
        countryNameLabel.text = nil
        extensionLabel.text = nil
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        let newAlpha: CGFloat = highlighted ? 0.5 : 1
        UIView.animate(withDuration: 0.2) {
            self.countryNameLabel.alpha = newAlpha
            self.extensionLabel.alpha = newAlpha
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected, let extensionNumber = extensionLabel.text {
            delegate?.didSelectExtension(extensionNumber)
        }
    }
}

extension CountryExtensionCell: Fillable {
    func fill(with model: SourceModel.Model?) {
        guard let model = model as? CountryExtension else { return }
        countryNameLabel.text = model.name
        extensionLabel.text = model.countryExtension
    }
}

extension CountryExtensionCell: Delegateble {
    func set(delegate: AnyObject) {
        self.delegate = delegate as? CountryExtesionDelegate
    }
}
