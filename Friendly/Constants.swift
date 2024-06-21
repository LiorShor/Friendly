//
//  Constants.swift
//  Friendly
//
//  Created by Lior Shor on 25/05/2023.
//

import Foundation

typealias SuccessCompletion = (_ success: Bool) -> Void
typealias CountriesCompletion = (_ response: CountriesResponse?, _ error: Error?) -> Void
typealias JSONDictionary = [String: Any]

enum Constants {
    static var phoneExtensionIL = "+972"
    
    enum Result<T: Codable> {
        case success(T)
        case failure(Error)
    }
    
    enum AnimationDuration {
        static let loader: TimeInterval = 0.25
    }
}
