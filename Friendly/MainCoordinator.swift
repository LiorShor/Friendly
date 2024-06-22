//
//  Coordinator.swift
//  Friendly
//
//  Created by Lior Shor on 03/11/2023.
//

import SwiftUI

final class Coordinator: ObservableObject {
    public enum Page: String, Identifiable {
        case otpView
        case phoneAuthentication
        
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

    @Published var path: [Page] = []
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    // MARK: - Navigation fuctions
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .phoneAuthentication:
            PhoneAuthentication(viewModel: PhoneAuthenticationViewModel(router: self))
        case .otpView:
            OtpView()
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
}

extension Coordinator: LoginRouter {
    func pushPhoneAuthentication() {
        path.append(.phoneAuthentication)
    }
}

extension Coordinator: PhoneAuthenticationRouter {
    func proceedToOtp() {
        path.append(.otpView)
    }
    
    func presentPhoneExtensions() {
        
    }
}
