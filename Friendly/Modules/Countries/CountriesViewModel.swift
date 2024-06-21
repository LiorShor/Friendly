//
//  CountriesViewModel.swift
//  Friendly
//
//  Created by Lior Shor on 16/12/2023.
//

import Foundation
import Combine

class CountriesViewModel: ObservableObject {
    @Published var countries = CountriesResponse(items: [])
    var selectedCountry: CountryExtension? {
        didSet {
            onCountrySelected?(selectedCountry)
        }
    }
    var onCountrySelected: ((CountryExtension?) -> Void)?
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchCountries() {
        let staticDataProvider = StaticDataProvider()
        staticDataProvider.fetchFromLocalFileCombine(.countries)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    // Handle error (optional)
                    print("Failed to fetch countries: \(error)")
                }
            }, receiveValue: { response in
                // Update the @Published property
                self.countries = response
            })
            .store(in: &cancellables)
    }
}
