//
//  BitMaskCategory.swift
//  WarFly
//
//  Created by Katsiaryna Kulik  on 26.08.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import SpriteKit

extension SKPhysicsBody {
    var category: BitMaskCategory {
        get {
            return BitMaskCategory(rawValue: self.categoryBitMask)
        }

        set {
            self.categoryBitMask = newValue.rawValue
        }
    }
}

struct BitMaskCategory: OptionSet {
    let rawValue: UInt32

    static let none    = BitMaskCategory(rawValue: 0 << 0)      // 00000000000000..0    0
    static let player  = BitMaskCategory(rawValue: 1 << 0)      // 000000000000...01    1
    static let enemy   = BitMaskCategory(rawValue: 1 << 1)      // 000000000000...10    2
    static let powerUp = BitMaskCategory(rawValue: 1 << 2)      // 000000000000..100    4
    static let shot    = BitMaskCategory(rawValue: 1 << 3)      // 000000000000.1000    8
    static let all     = BitMaskCategory(rawValue: UInt32.max)
}
