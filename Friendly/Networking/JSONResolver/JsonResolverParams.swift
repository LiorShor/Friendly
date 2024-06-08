//
//  JsonResolverParams.swift
//  Friendly
//
//  Created by Lior Shor on 16/12/2023.
//

import Foundation

enum JsonResolverParams: String {
    case type
    case imageName
    case placeholder
    case imageUrl
    case items
    case model
}

protocol JSONResolver {
    static func resolve(_ data: Data) throws -> Data
}

extension JSONResolver {
    static func resolve(_ data: Data) throws -> Data { data }
}
