//
//  PhoneExtensionParameterable.swift
//  Friendly
//
//  Created by Lior Shor on 27/05/2023.
//

protocol PhoneExtensionParameterable {
    var countriesCollection: CountriesCollection? { get }
    
    func setCountries(items: [CountryExtension])
}

class PhoneExtensionParameters: Parameters, PhoneExtensionParameterable {
    var countriesCollection: CountriesCollection?
    
    func setCountries(items: [CountryExtension]) {
        self.countriesCollection = CountriesCollection(items: items)
    }

}
