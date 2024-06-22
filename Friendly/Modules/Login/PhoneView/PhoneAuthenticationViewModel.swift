//
//  PhoneAuthenticationViewModel.swift
//  Friendly
//
//  Created by Lior Shor on 15/12/2023.
//

import Foundation

protocol PhoneAuthenticationRouter {
    func proceedToOtp()
    func presentPhoneExtensions()
}

class PhoneAuthenticationViewModel: ObservableObject {
    let router: PhoneAuthenticationRouter
    
    @Published var selectedCountry: CountryExtension?
    @Published var countryExtension: String = Constants.phoneExtensionIL
    
    init(router: PhoneAuthenticationRouter) {
        self.router = router
        countryExtension = selectedCountry?.countryExtension ?? Constants.phoneExtensionIL
    }

    func didTapExtensionsButton() {
        router.presentPhoneExtensions()
    }
    
    func didTapContinueButton() {
        router.proceedToOtp()
    }
}
