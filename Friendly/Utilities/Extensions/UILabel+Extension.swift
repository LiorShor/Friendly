//
//  UILabel+Extension.swift
//  Friendly
//
//  Created by Lior Shor on 25/05/2023.
//

import UIKit

extension UILabel {
    @IBInspectable var localizedText: String? {
        get { return text }
        set { text = newValue?.localized }
    }
}
