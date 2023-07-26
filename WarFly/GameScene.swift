//
//  GameScene.swift
//  WarFly
//
//  Created by Katsiaryna Kulik  on 24.07.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {

      let screenCenterPoint = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
      let background = Background.populateBackground(at: screenCenterPoint)
      background.size = self.size
      self.addChild(background)

    }
}
