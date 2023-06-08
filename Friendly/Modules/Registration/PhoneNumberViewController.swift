//
//  PhoneNumberViewController.swift
//  Friendly
//
//  Created by Lior Shor on 26/05/2023.
//

import UIKit

class PhoneNumberViewController: BaseViewController, Storyboarded {
   
    // MARK: - IBOutlet
    
    
    @IBOutlet private weak var phoneNumberTextfield: UITextField!
    
    // MARK: - Parameters
    
    private var presenter: PhoneNumberPresenter!
    private var originalButtonFrame: CGRect?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        phoneNumberTextfield.becomeFirstResponder()
        phoneNumberTextfield.allowOnlyNumericInput()
        phoneNumberTextfield.delegate = self
    }
    
    func set(_ presenter: PhoneNumberPresenter) {
        self.presenter = presenter
    }
    
    @IBAction func onNextButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func didTapExtensionButton(_ sender: UIButton) {
        presenter.didTapExtensionButton()
    }
}

extension PhoneNumberViewController: PhoneNumberViewable {
    
}

extension PhoneNumberViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}

extension PhoneNumberViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
