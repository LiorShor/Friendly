//
//  CountryExtension.swift
//  Friendly
//
//  Created by Lior Shor on 27/05/2023.
//

import Foundation
import SourceModel

class CountryExtension: Model, Parsable, Equatable {
    
    var countryExtension: String?
    var name: String?
    var code: String?
    
    enum CodingKeys: String, CodingKey {
        case code
        case name
        case countryExtension = "dial_code"
    }

    static func == (lhs: CountryExtension, rhs: CountryExtension) -> Bool {
        lhs.code == rhs.code
    }
    
}
