//
//  JSONResolver+Countries.swift
//  Friendly
//
//  Created by Lior Shor on 27/05/2023.
//

import Foundation

//protocol CountriesJSONResolver: JSONResolver {}

protocol CountriesJSONResolver { }

extension CountriesJSONResolver {
    
    static func resolve(_ data: Data) throws -> Data {
        guard let debitMandates = try? data.parse(type: CountriesResponse.self) else { return data }
        
        var jsonDictionary = JSONDictionary()
        var subscriptions: [JSONDictionary] = []
        
        for debitMandate in debitMandates.items ?? [] {
            var subscription = JSONDictionary()
            subscription["name"] = debitMandate.name
            subscription["countryExtension"] = debitMandate.countryExtension
            subscription["code"] = debitMandate.code
            subscriptions.append(subscription)
        }
        
        jsonDictionary[JsonResolverParams.items.rawValue] = subscriptions
        return try JSONSerialization.data(withJSONObject: jsonDictionary, options: [])
    }
}
import Foundation


