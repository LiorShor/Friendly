//
//  PhoneAuthentication.swift
//  Friendly
//
//  Created by Lior Shor on 03/11/2023.
//

import SwiftUI

struct PhoneAuthentication: View {
    @ObservedObject var viewModel: PhoneAuthenticationViewModel
    @State var isPresented: Bool = false
    init(coordinator: Coordinator) {
        self.viewModel = PhoneAuthenticationViewModel(coordinator: coordinator)
    }

    @State private var text: String = .empty

    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(Translations.CAN_WE_GET_YOUR_NUMBER.localized)
                    .font(.largeTitle)
                    .padding()
                Spacer()
            }
            ButtonTextField(buttonTitle: $viewModel.countryExtension, didTapButton: {
                isPresented.toggle()
            })
            .padding(.horizontal)
         
            Text(Translations.SMS_VERIFICATION_NOTE.localized)
                .font(.caption2)
                .padding(.leading)
            Spacer()
            HStack {
                Spacer()
                CustomSocialButton(text: .constant(Translations.NEXT.localized), image: .empty, textColor: .systemBlue, strokeColor: .systemBlue)
                    .padding(.horizontal, 50)
                    .onTapGesture {
                        
                    }
                Spacer()
            }
        }
        .sheet(isPresented: $isPresented) {
            CountriesView(viewModel: CountriesViewModel(coordinator: viewModel.coordinator), didTapExtensionsButton: $isPresented) { onCountrySelected in
                viewModel.countryExtension = onCountrySelected?.countryExtension ?? "+975"
            }
        }
    }
    
}

struct PhoneAuthentication_Previews: PreviewProvider {
    static var previews: some View {
        PhoneAuthentication(coordinator: Coordinator())
    }
}
