//
//  Image+Extension.swift
//  Friendly
//
//  Created by Lior Shor on 21/06/2024.
//

import SwiftUI

extension Image {
    enum ImageName: String {
        case friendly = "Friendly"
        case appleLogo = "apple.logo"
    }
    
    init(name: ImageName) {
        self.init(name.rawValue)
    }
}
