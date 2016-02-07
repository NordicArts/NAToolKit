//
//  Image.swift
//  ToolKit
//
//  Created by Max Hooton on 07/02/2016.
//  Copyright © 2016 NordicArts. All rights reserved.
//

import Foundation
import UIKit

// MARK: Extension
extension UIImage {
    func resizeImage(width: Int, height: Int) -> UIImage {
        let hasAlpha:Bool = true
        let scale:CGFloat = 0.0
        let size:CGSize  = CGSize(width: width, height: height)
        
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
        self.drawInRect(CGRect(origin: CGPointZero, size: size))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }
}