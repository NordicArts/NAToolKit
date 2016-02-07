
//
//  ToolKitColor.swift
//  ToolKit
//
//  Created by Max Hooton on 07/02/2016.
//  Copyright © 2016 NordicArts. All rights reserved.
//

import Foundation
import UIKit

// MARK: Extension
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.stringByTrimmingCharactersInSet(NSCharacterSet.alphanumericCharacterSet().invertedSet)
        var int = UInt32()
        NSScanner(string: hex).scanHexInt(&int)
        
        let a:UInt32
        let r:UInt32
        let g:UInt32
        let b:UInt32
        
        switch hex.length {
        case 3:
            (a, r, g, b) = (255, ((int >> 8) * 17), ((int >> 4 & 0xF) * 17), ((int & 0xF) * 17))
            break
        case 6:
            (a, r, g, b) = (255, (int >> 16), (int >> 8 & 0xFF), (int & 0xFF))
            break
        case 8:
            (a, r, g, b) = ((int >> 24), (int >> 16 & 0xFF), (int >> 8 & 0xFF), (int & 0xFF))
            break
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            red: CGFloat(r) / 255,
            green: CGFloat(g) / 255,
            blue: CGFloat(b) / 255,
            alpha: CGFloat(a) / 255
        )
    }
}