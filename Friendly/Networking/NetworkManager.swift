//
//  NetworkManager.swift
//  Friendly
//
//  Created by Lior Shor on 25/05/2023.
//

import Foundation
import Moya

class NetworkManager<E: TargetType> {
    
    typealias EndPoint = E

    private var provider: MoyaProvider<EndPoint>?
    
    init() {
        configure()
    }
    
    func request<T>(_ endpoint: Moya.TargetType, completion: @escaping (Constants.Result<T>) -> Void) where T: Codable  {
        self.makeRequest(endpoint, completion: { (result: Constants.Result<T>) in
            completion(result)
        })
    }
    
    private func configure() {
        let requestClosure: MoyaProvider<EndPoint>.RequestClosure = { (endpoint: Endpoint, done: @escaping MoyaProvider.RequestResultClosure) in
            guard let request = try? endpoint.urlRequest() else { return }
            done(.success(request))
        }
        provider = MoyaProvider<EndPoint>(requestClosure: requestClosure)
    }
}

extension NetworkManager {
    
    fileprivate func makeRequest<T: Codable>(_ endpoint: TargetType, completion: @escaping (Constants.Result<T>) -> Void) {
        
        guard let provider = provider else { return }
        
        provider.request(endpoint as! E) { result in
            
            switch result {
            case .success(let response):
                do {
                    if let responseJson = try? response.mapJSON() {
                        self.printSuccessData(responseJson, response)
                    }
                    
                    let model: T = try response.data.parse(type: T.self)
                    completion(.success(model))
                } catch {
                    self.printDecodingError(response, error)
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    fileprivate func printDecodingError(_ response: Response, _ error: Error?) {
        print("🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨")
        print("Got error from")
        if let url = response.request?.urlRequest {
            print("\(String(describing: url))")
        }
        print("Http Method: \(response.request?.httpMethod ?? "METHOD UNKNOWN")")
        print("Status Code: \(response.statusCode)")
        print("\(String(describing: error))")
        print("🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨")
    }
    
    fileprivate func printSuccessData(_ responseJson: Any, _ response: Response) {
        print("\n")
        print("📊📊📊📊📊📊📊📊📊📊📊📊📊📊")
        print("Success from:")
        if let url = response.request?.url {
            print("\(String(describing: url))")
        }
        print("Status Code: \(response.statusCode)")
        if let prettyJSON = response.data.prettyPrintedJSON {
            print(prettyJSON)
        }
        print("📊📊📊📊📊📊📊📊📊📊📊📊📊📊")
        print("\n")
    }
}
