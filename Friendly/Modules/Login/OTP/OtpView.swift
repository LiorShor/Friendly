//
//  OtpView.swift
//  Friendly
//
//  Created by Lior Shor on 21/06/2024.
//

import SwiftUI

struct OtpView: View {
    @State var otpCode: String = .empty
    let phoneNumber: String
    var strokeColor: Color = .blue
    @FocusState private var textFieldFocused: Bool
    
    init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Translations.ENTER_YOUR_CODE.localized)
                .font(.title)
                .padding()
            HStack {
                Text(phoneNumber)
                    .font(.subheadline)
                Button {
                    <#code#>
                } label: {
                    Text("Resend")
                        .bold()
                }

            }
            TextField("", text: $otpCode)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .focused($textFieldFocused)
                .textFieldStyle(.plain)
                .overlay(RoundedRectangle(cornerRadius: 4)
                    .stroke(strokeColor, lineWidth: 0.5))
                .font(.title2)
                .padding()
                .padding(.horizontal, 100)
                .onAppear {
                    textFieldFocused.toggle()
                }
        }
    }
    
    
    struct OTPDigitTextField: View {
        @Binding var digit: String
        
        var body: some View {
            TextField("", text: $digit)
                .frame(width: 40, height: 40)
                .background(Color.white)
                .cornerRadius(4)
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(.blue, lineWidth: 1)
                )
        }
    }
}

#Preview {
    OtpView()
}
