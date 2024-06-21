//
//  LoginViewModel.swift
//  Friendly
//
//  Created by Lior Shor on 03/11/2023.
//

import Foundation
import AuthenticationServices
import CryptoKit

protocol LoginRouter {
    func pushPhoneAuthentication()
}

class LoginViewModel: NSObject, ObservableObject {
    private var currentNonce: String?
    let router: LoginRouter
    
    init(router: LoginRouter) {
        self.router = router
    }
    
    func didTapSignInWithPhone() {
        router.pushPhoneAuthentication()
    }
}

extension LoginViewModel: ASAuthorizationControllerDelegate {
    
    func performAppleSignIn() {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.performRequests()
    }

    // Temporary storage for the nonce used during authentication
    
    // Function to be called when the user taps the sign-in button
    func signInWithApple() {

        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        // Generate a nonce for validation after authentication
        let nonce = randomNonceString()
        currentNonce = nonce
        request.nonce = sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
    
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    // Generate a random nonce
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: Array<Character> =
            Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0..<16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential,
           let nonce = currentNonce,
           let appleIDToken = appleIDCredential.identityToken,
           let idTokenString = String(data: appleIDToken, encoding: .utf8) {
            // Handle the received authorization token and nonce as needed
            print("Got token: \(idTokenString) and nonce: \(nonce)")
            // Here, send the token and nonce to your server or handle them as needed for your use case.
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
        print("Authorization failed with error: \(error.localizedDescription)")
    }
}

