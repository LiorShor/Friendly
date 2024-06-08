//
//  CoordinatorView.swift
//  Friendly
//
//  Created by Lior Shor on 03/11/2023.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        VStack {
            NavigationStack(path: $coordinator.path) {
                coordinator.build(page: .main)
                    .navigationDestination(for: Page.self) { page in
                        coordinator.build(page: page)
                    }
                    .sheet(item: $coordinator.sheet) { sheet in
                        coordinator.build(sheet: sheet)
                    }
                    .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
                        coordinator.build(fullScreenCover: fullScreenCover)
                    }
            }
            .environmentObject(coordinator)
        }
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}
