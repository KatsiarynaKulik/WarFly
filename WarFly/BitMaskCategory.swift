//
//  BitMaskCategory.swift
//  WarFly
//
//  Created by Katsiaryna Kulik  on 26.08.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import Foundation

struct BitMaskCategory {
  static let player: UInt32 = 0x1 << 0
  static let enemy: UInt32 = 0x1 << 1
  static let powerUp: UInt32 = 0x1 << 2
  static let shot: UInt32 = 0x1 << 3

}
