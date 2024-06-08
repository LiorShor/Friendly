//
//  PhoneAuthenticationViewModel.swift
//  Friendly
//
//  Created by Lior Shor on 15/12/2023.
//

import Foundation

class PhoneAuthenticationViewModel: ObservableObject {
    var coordinator: Coordinator
    @Published var selectedCountry: CountryExtension?
    @Published var countryExtension: String = "+972"
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
//        selectedCountry = coordinator.selectedCountry
        countryExtension = selectedCountry?.countryExtension ?? "+972"
    }
    
    func didTapExtensionsButton() {
        coordinator.present(sheet: .countries)
    }
}
