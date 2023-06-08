//
//  JSONResolver.swift
//  Friendly
//
//  Created by Lior Shor on 27/05/2023.
//

import Foundation


enum JsonResolverParams: String {
    case items
}

protocol JSONResolver {
    static func resolve(_ data: Data) throws -> Data
}

extension JSONResolver {
    static func resolve(_ data: Data) throws -> Data { data }
}
