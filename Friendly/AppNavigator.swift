//
//  AppNavigator.swift
//  Friendly
//
//  Created by Lior Shor on 21/06/2024.
//

import SwiftUI

struct AppNavigator: View {
    
    @ObservedObject var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            // The navigationDestination modifier u put on the root view of the navigator, in this case - FirstView
            // That can also be dynamic using an if or switch statements
            LoginView(viewModel: LoginViewModel(router: coordinator))
                .navigationDestination(for: Coordinator.Destination.self) { destination in
                    coordinator.build(page: .phoneAuthentication)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.build(sheet: .countries)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
                    coordinator.build(fullScreenCover: fullScreenCover)
                }
            // Instead of using SwiftUI's environment, the router can be passed via ViewModels, Presenters or whatever ur'e using :)
            // .environmentObject(coordinator)
        }
    }
}

#Preview {
    AppNavigator()
}
