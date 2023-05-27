//
//  BaseViewController.swift
//  Friendly
//
//  Created by Lior Shor on 26/05/2023.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    
    private var originalButtonFrame: CGRect?
    
    // MARK: - Lifecylce
    
    override func viewDidLoad() {
        subscribeKeyboardNotifications()
        setupUI()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Private methods
    
    private func setupUI() {
        hideKeyboardWhenTappedAround()
        originalButtonFrame = continueButton.frame
    }
    
    private func subscribeKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardDidShow(_ notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect, let originalButtonFrame = self.originalButtonFrame {
            let buttonBottomY = (originalButtonFrame.origin.y) + (originalButtonFrame.size.height)
            let keyboardTopY = keyboardFrame.origin.y
            if buttonBottomY > keyboardTopY { // Check if the button is below the keyboard
                UIView.animate(withDuration: 0.5) { [weak self] in
                    self?.bottomConstraint.constant = keyboardFrame.height
                }
            }
        }
    }

    @objc private func keyboardWillHide() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.bottomConstraint.constant = 50
        }
    }
}
