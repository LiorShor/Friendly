//
//  UITextfield+Extension.swift
//  Friendly
//
//  Created by Lior Shor on 26/05/2023.
//

import UIKit

extension UITextField {
    func allowOnlyNumericInput() {
        self.keyboardType = .numberPad
        let numericDelegate = NumericTextFieldDelegate()
        self.delegate = numericDelegate
        objc_setAssociatedObject(self, &NumericTextFieldDelegate.associatedObjectKey, numericDelegate, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}

class NumericTextFieldDelegate: NSObject, UITextFieldDelegate {
    static var associatedObjectKey = "NumericTextFieldDelegate"

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Check if the replacement string is empty (e.g., during QuickType suggestion)
        if string.isEmpty {
            return true
        }
        
        // Check if the replacement string contains non-numeric characters
        let nonNumericCharacterSet = CharacterSet(charactersIn: string).inverted
        if let _ = string.rangeOfCharacter(from: nonNumericCharacterSet) {
            return false
        }
        
        // Check if the text field already contains a "+" character
        let currentText = textField.text ?? ""
        let hasPlusCharacter = currentText.contains("+")
        
        // Allow deletion of characters
        let isDeletion = string.isEmpty && range.length == 1
        
        return isDeletion || (string == "+" && !hasPlusCharacter) || !hasPlusCharacter
    }
}
