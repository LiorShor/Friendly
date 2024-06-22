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
    init(viewModel: PhoneAuthenticationViewModel) {
        self.viewModel = viewModel
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
            CustomSocialButton(text: .constant(Translations.NEXT.localized), image: .empty, textColor: .blue, strokeColor: .blue) {
                viewModel.didTapContinueButton()
            }
            .padding(.horizontal, 50)
            .padding(.bottom, 50)
        }
        .sheet(isPresented: $isPresented) {
            CountriesView(viewModel: CountriesViewModel()) { onCountrySelected in
                isPresented.toggle()
                viewModel.countryExtension = onCountrySelected?.countryExtension ?? "+975"
            }
        }
    }
    
}

struct PhoneAuthentication_Previews: PreviewProvider {
    static var previews: some View {
        PhoneAuthentication(viewModel: PhoneAuthenticationViewModel(router: Coordinator()))
    }
}
