//
//  utils.swift
//  Aydin_MyOrder
//
//  Created by Aydin Battal on 2021-10-15.
//

import Foundation

enum Type: String {
case darkRoast = "Dark Roast"
case originalBlend = "Original Blend"
case vanilla = "Vanilla"
    
    var id: String { self.rawValue }
}

enum Size: String {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
    
    var id: String { self.rawValue }
}
