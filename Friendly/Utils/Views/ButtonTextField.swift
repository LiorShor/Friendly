//
//  ButtonTextField.swift
//  Friendly
//
//  Created by Lior Shor on 15/12/2023.
//

import SwiftUI

struct ButtonTextField: View {
    @State var text: String = .empty
    @Binding var buttonTitle: String
    @FocusState private var textFieldFocused: Bool
    var buttonImage: String = "phone.badge.waveform"
    var textColor: Color = .systemBlue
    var strokeColor: Color = .systemBlue
    var cornerRadius: CGFloat = 4
    var didTapButton: (() -> Void)?
    var body: some View {
        HStack {
            CustomSocialButton(text: $buttonTitle, image: buttonImage, textColor: textColor, strokeColor: strokeColor,cornerRadius: cornerRadius, isSpacerNeeded: true, action: {
                didTapButton?()
            })
            .frame(width: 130)
            TextField("", text: $text)
                .textFieldStyle(PlainTextFieldStyle())
                .bold()
                .foregroundColor(textColor)
                .frame(height: 50)
                .padding([.horizontal], 10) // Inner padding
                .cornerRadius(4)
                .overlay(RoundedRectangle(cornerRadius: 4).stroke(strokeColor, lineWidth: 0.5))
                .keyboardType(.phonePad)
                .focused($textFieldFocused)
        }
        .onAppear {
            textFieldFocused.toggle()
        }
    }
}

struct ButtonTextField_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTextField(buttonTitle: .constant(""))
    }
}
