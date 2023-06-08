//
//  PhoneExtensionActionable.swift
//  Friendly
//
//  Created by Lior Shor on 27/05/2023.
//

protocol PhoneExtensionActionable {
    func fetchCountries(completion: @escaping CountriesCompletion)
}

extension Actions: PhoneExtensionActionable {
    func fetchCountries(completion: @escaping CountriesCompletion) {
        dataProviders.staticDataProvider.fetchFromLocalFile(.countries) { (result:Constants.Result<CountriesResponse>) in
            switch result {
            case .success(let response):
                completion(response, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
