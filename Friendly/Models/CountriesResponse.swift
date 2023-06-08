//
//  CountriesResponse.swift
//  Friendly
//
//  Created by Lior Shor on 27/05/2023.
//

import Foundation

struct CountriesResponse: Codable, JSONResolver {
    var items: [CountryExtension]?
}
