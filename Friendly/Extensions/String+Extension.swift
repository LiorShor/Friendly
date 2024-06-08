//
//  String+Extension.swift
//  Friendly
//
//  Created by Lior Shor on 26/05/2023.
//

import Foundation

extension String {
    static let empty: String = ""
    var localized: String { NSLocalizedString(self, comment: "") }
}
