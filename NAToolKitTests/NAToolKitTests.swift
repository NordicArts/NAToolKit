//
//  ToolKitTests.swift
//  ToolKitTests
//
//  Created by Max Hooton on 07/02/2016.
//  Copyright © 2016 NordicArts. All rights reserved.
//

import Quick
import Nimble
import NAToolKit

class ToolKitTests: QuickSpec {
    override func spec() {
        describe("ToolKit") {
            it("works") {
                expect(true).to(beTrue())
                
            }
        }
        
        describe("ToolKit HexColor") {
            it("corect representation based on hex") {
                let throughbotRed = UIColor(
                    red: CGFloat(255 / 255),
                    green: CGFloat(0 / 255),
                    blue: CGFloat(0 / 255),
                    alpha: 1
                )
                let color = UIColor(hexString: "#FF0000")
                
                print("Color \(color)")
                print("Check \(throughbotRed)")
                
                expect(color).to(equal(throughbotRed))
            }
        }
    }
}