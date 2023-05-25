//
//  Constants.swift
//  Friendly
//
//  Created by Lior Shor on 25/05/2023.
//

import Foundation

typealias SuccessCompletion = (_ success: Bool) -> Void

enum Constants {
    
    enum Result<T: Codable> {
        case success(T)
        case failure(Error)
    }
}
