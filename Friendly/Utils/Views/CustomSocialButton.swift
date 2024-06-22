//
//  CustomSignInWithAppleButton.swift
//  Friendly
//
//  Created by Lior Shor on 03/11/2023.
//

import SwiftUI

struct CustomSocialButton: View {
    @Binding var text: String
    var image: String
    var textColor: Color
    var strokeColor: Color
    var backgroundColor: Color = Color(.backgroundColor)
    var cornerRadius: CGFloat = 25
    var isSpacerNeeded: Bool = true
    
    var action: (() -> ())?
    
    var body: some View {
        Button(
            action: {
                action?()
            },
            label: {
                HStack {
                    if isSpacerNeeded {
                        Spacer()
                    }
                    if image.isEmpty == false {
                        Image(systemName: image)
                            .foregroundColor(textColor)
                    }
                    withAnimation {
                        Text(text)
                            .bold()
                            .foregroundColor(textColor)
                    }
                    if isSpacerNeeded {
                        Spacer()
                    }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(strokeColor, lineWidth: 1)
                    
                )
            })
        .background(backgroundColor)
        .cornerRadius(cornerRadius)
    }
}
struct CustomSocialButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomSocialButton(text: .constant("Sign in with Apple"), image: "apple.logo", textColor: .purple, strokeColor: .purple, isSpacerNeeded: true)
    }
}
