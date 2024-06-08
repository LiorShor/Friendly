//
//  LoginView.swift
//  Friendly
//
//  Created by Lior Shor on 03/11/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {
            Color.systemBackground
                .ignoresSafeArea()
            VStack {
                Image("Friendly")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .frame(width: 100, height: 100)
                    .padding(.top, 100)
                Text("Friendly")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color.systemBlue)
                Spacer()
                VStack(spacing: 15) {
                    CustomSocialButton(
                        text: .constant(Translations.SIGN_IN_WITH_APPLE.localized), image: "apple.logo",
                        textColor: Color.systemBlue,
                        strokeColor: Color.systemBlue,
                        action: {
                                                    viewModel.performAppleSignIn()
                        })
                    
                    CustomSocialButton(
                        text: .constant(Translations.SIGN_IN_WITH_PHONE_NUMBER.localized), image: "phone.fill",
                        textColor: Color.systemBlue,
                        strokeColor: Color.systemBlue,
                        action: {
                            viewModel.didTapSignInWithPhone()
                        }
                    )
                }
                .padding(.horizontal, 50)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel(coordinator: nil))
            .environment(\.colorScheme, .dark)
    }
}
