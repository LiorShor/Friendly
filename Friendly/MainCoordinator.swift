//
//  Coordinator.swift
//  Friendly
//
//  Created by Lior Shor on 03/11/2023.
//

import SwiftUI

final class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var page: Page? = .main
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    var selectedCountry: CountryExtension?
    
    // MARK: - Navigation fuctions
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    func dismissPage() {
        self.page = nil
    }
    
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    func present(fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func present(page: Page) {
        self.page = page
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .main:
            LoginView(viewModel: LoginViewModel(coordinator: self))
        case .phoneAuthentication:
            PhoneAuthentication(coordinator: self)
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
//        switch sheet {
//        case .countries:
//            CountriesView(didTapExtensionsButton: ., viewModel: CountriesViewModel(coordinator: self))
//        }
    }
    
    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .phoneAuthentication:
            PhoneAuthentication(coordinator: self)
        }
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
