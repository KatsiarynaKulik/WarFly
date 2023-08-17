//
//  Enemy.swift
//  WarFly
//
//  Created by Katsiaryna Kulik  on 16.08.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import SpriteKit

class Enemy: SKSpriteNode {

    static var textureAtlas: SKTextureAtlas?

    init() {
        let texture = Enemy.textureAtlas?.textureNamed("airplane_4ver2_13")
        super.init(texture: texture, color: .clear, size: CGSize(width: 221, height: 204))
        self.xScale = 0.5
        self.yScale = -0.5
        self.zPosition = 20
        self.name = "sprite"
    }

  func flySpiral() {
    let screenSice = UIScreen.main.bounds
    let timeHorizontal: Double = 3
    let timeVertical: Double = 10
    let moveLeft = SKAction.moveTo(x: 50, duration: timeHorizontal)
    moveLeft.timingMode = .easeInEaseOut
    let moveRight = SKAction.moveTo(x: screenSice.width - 50, duration: timeHorizontal)
    moveRight.timingMode = .easeInEaseOut

    let asideMovementCenter = SKAction.sequence([moveLeft, moveRight])
    let foreverAsideMovement = SKAction.repeatForever(asideMovementCenter)
    let forwardMovement = SKAction.moveTo(y: -105, duration: timeVertical)
    let groupMovement = SKAction.group([foreverAsideMovement, forwardMovement])
    self.run(groupMovement)


  }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
