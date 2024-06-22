//
//  Color+Extension.swift
//  Friendly
//
//  Created by Lior Shor on 21/06/2024.
//

import SwiftUI

extension Color {
    enum ColorName: String {
        case backgroundColor
        case base
        case secondaryBase
    }
    
    init(_ name: ColorName) {
        self.init(name.rawValue)
    }
}
