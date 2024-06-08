//
//  StaticEndPoints.swift
//  Friendly
//
//  Created by Lior Shor on 27/05/2023.
//

import Foundation
import Moya

enum StaticEndPoints: TargetType {
    var baseURL: URL { URL(string: .empty)! }
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        return .requestPlain
    }
    
    var headers: [String : String]?  { nil }
    
    
    case countries
    
    var path: String {
        switch self {
        case .countries: return "/CountryCodes.json"
        }
    }
    
    private var stringFromFile: String {
        if let filePath = Bundle.main.path(forResource: path, ofType: "") {
            do {
                return try String(contentsOfFile: filePath)
            } catch (let error) {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("Stub's JSON file named: \(path) was not found in `Stubs` directory. Stub's JSON File name must be: \(path).json")
        }
    }
    
    var localFileDataEncoded: Data {
        return self.stringFromFile.data(using: .utf8)!
    }
    
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
        return .useDefaultKeys
    }
    
    var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy {
        return .iso8601
    }
}
