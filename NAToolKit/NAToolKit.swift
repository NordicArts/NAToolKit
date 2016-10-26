//
//  NAToolKit.swift
//  NAToolKit
//
//  Created by Max Hooton on 07/02/2016.
//  Copyright © 2016 NordicArts. All rights reserved.
//

import Foundation
import UIKit

// MARK: String
public extension String {
    public var length: Int {
        get {
            return self.characters.count
        }
    }
}

// MARK: UIImage
public extension UIImage {
    public func resizeImage(_ width: Int, height: Int) -> UIImage {
        let hasAlpha:Bool = true
        let scale:CGFloat = 0.0
        let size:CGSize  = CGSize(width: width, height: height)
        
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage!
    }
}

// MARK: UIColor
public extension UIColor {
    public convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        
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
