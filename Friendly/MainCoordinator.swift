//
//  Coordinator.swift
//  Friendly
//
//  Created by Lior Shor on 03/11/2023.
//

import SwiftUI

final class Coordinator: ObservableObject {
    public enum Destination: String, Hashable, Codable, Identifiable {
        
//        case CountriesView
        case PhoneAuthentication
        
        var id: String {
            self.rawValue
        }
    }
    enum Page: String, Identifiable {
        case main, phoneAuthentication
        
        var id: String {
            self.rawValue
        }
    }

    enum Sheet: String, Identifiable {
        case countries
        
        var id: String {
            self.rawValue
        }
    }

    enum FullScreenCover: String, Identifiable {
        case phoneAuthentication
        
        var id: String {
            self.rawValue
        }
    }

    @Published var path: [Destination] = []
    @Published var page: Page? = .main
    @Published var sheet: Destination?
    @Published var fullScreenCover: FullScreenCover?
    
    func pushPhoneAuthentication() {
        path.append(.PhoneAuthentication)
    }

    var selectedCountry: CountryExtension?
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .main:
            LoginView(viewModel: LoginViewModel(router: self))
        case .phoneAuthentication:
            PhoneAuthentication(viewModel: PhoneAuthenticationViewModel(router: self))
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .countries:
            CountriesView(viewModel: CountriesViewModel())
        }
    }
    
    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .phoneAuthentication:
            PhoneAuthentication(viewModel: PhoneAuthenticationViewModel(router: self))
        }
    }
    // MARK: - Navigation fuctions
}

extension Coordinator: LoginRouter {
    func presentCountriesView() {
        
    }
}

extension Coordinator: PhoneAuthenticationRouter {
    func proceedToMatchFinder() {
            
    }
    
    func presentPhoneExtensions() {
        
    }
}
