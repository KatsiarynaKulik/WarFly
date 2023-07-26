//
//  Background.swift
//  WarFly
//
//  Created by Katsiaryna Kulik  on 26.07.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import SpriteKit

class Background: SKSpriteNode {

  static func populateBackground(at point: CGPoint) -> Background {
    
    let background = Background(imageNamed: "background")
    background.position = point
    background.zPosition = 0
    
    return background
  }
}
