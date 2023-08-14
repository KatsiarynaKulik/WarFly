//
//  PowerUp.swift
//  WarFly
//
//  Created by Katsiaryna Kulik  on 14.08.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import UIKit
import SpriteKit

class PowerUp: SKSpriteNode {
  let initialSice = CGSize(width: 52, height: 52)
  let textureAtlas = SKTextureAtlas(named: "GreenPowerUp")
  var animationSpriteArray = [SKTexture]()

  init() {
    let greenTexture = textureAtlas.textureNamed("missle_green_01")
    super.init(texture: greenTexture, color: .clear, size: initialSice)
    self.name = "powerUp"
    self.zPosition = 20
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implented")
  }

  func performRotation() {
    for i in 1...15 {
      let number = String(format: "%02d", i)
      animationSpriteArray.append(SKTexture(imageNamed: "missle_green_\(number)"))
    }
    SKTexture.preload(animationSpriteArray) {
      let rotation = SKAction.animate(with: self.animationSpriteArray, timePerFrame: 0.05, resize: true, restore: false)
      let rorerionForever = SKAction.repeatForever(rotation)
      self.run(rorerionForever)
    }
  }

}
