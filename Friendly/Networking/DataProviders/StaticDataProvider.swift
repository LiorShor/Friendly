//
//  StaticDataProvider.swift
//  Friendly
//
//  Created by Lior Shor on 27/05/2023.
//

import Foundation
import Combine

typealias Parsable = Codable & JSONResolver

class StaticDataProvider: JSONResolver {
    private let networkManager = NetworkManager<StaticEndPoints>()
    
    func fetchFromLocalFile<T: Parsable>(_ endpoint: StaticEndPoints, completion: @escaping (Constants.Result<T>) -> Void) {
        do {
            let model: T = try T
                .resolve(endpoint.localFileDataEncoded)
                .parse(type: T.self, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy.iso8601, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy.useDefaultKeys)
            completion(.success(model))
            
        } catch {
            
        }
    }
    
    func fetchFromLocalFileCombine<T: Parsable>(_ endpoint: StaticEndPoints) -> AnyPublisher<T, Error> {
        return Future { promise in
            do {
                let model: T = try T
                    .resolve(endpoint.localFileDataEncoded)
                    .parse(type: T.self, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy.iso8601, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy.useDefaultKeys)
                promise(.success(model))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
}
