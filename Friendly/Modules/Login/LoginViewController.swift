//
//  LoginViewController.swift
//  Friendly
//
//  Created by Lior Shor on 25/05/2023.
//

import UIKit
import AuthenticationServices
import SourceModel

class LoginViewController: UIViewController, Storyboarded {
    private var presenter: LoginPresenter!
    
    @IBAction func onSignInWithAppleTapped(_ sender: UIButton) {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.email]
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
    
    @IBAction func onSignInWithPhone(_ sender: Any) {
        
    }
    
    func set(_ presenter: LoginPresenter) {
        self.presenter = presenter
    }
}

extension LoginViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as?  ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            print("User id is \(userIdentifier) \n Full Name is \(String(describing: fullName)) \n Email id is \(String(describing: email))")
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    // Handle error.
    }
}

extension LoginViewController: LoginViewable {
    func setupTableView(with modelCollection: ModelCollection?) {
        
    }
}
