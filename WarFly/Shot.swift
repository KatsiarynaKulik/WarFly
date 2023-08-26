//
//  Shot.swift
//  WarFly
//
//  Created by Katsiaryna Kulik  on 23.08.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import SpriteKit

class Shot: SKSpriteNode {
    let screenSize = UIScreen.main.bounds

    fileprivate let initialSize = CGSize(width: 187, height: 237)
    fileprivate let textureAtlas: SKTextureAtlas!
    fileprivate var textureNameBeingsWith = ""
    fileprivate var animationSpriteArray = [SKTexture]()

    init(textureAtlas: SKTextureAtlas) {
        self.textureAtlas = textureAtlas
        let textureName = textureAtlas.textureNames.sorted()[0]
        let texture = textureAtlas.textureNamed(textureName)
        textureNameBeingsWith = String(textureName.dropLast(6))
        super.init(texture: texture, color: .clear, size: initialSize)
        self.setScale(0.3)
        self.name = "shotSprite"
        self.zPosition = 30

      self.physicsBody = SKPhysicsBody(texture: texture, alphaThreshold: 0.5, size: self.size)
      self.physicsBody?.isDynamic = false
      self.physicsBody?.categoryBitMask = BitMaskCategory.shot
      self.physicsBody?.collisionBitMask = BitMaskCategory.enemy
      self.physicsBody?.contactTestBitMask = BitMaskCategory.enemy
    }

    func startMovement() {
        performRotation()

        let moveForward = SKAction.moveTo(y: screenSize.height + 100, duration: 2)
        self.run(moveForward)
    }


    fileprivate func performRotation() {
        for i in 1...32 {
            let number = String(format: "%02d", i)
            animationSpriteArray.append(SKTexture(imageNamed: textureNameBeingsWith + number.description))
        }

        SKTexture.preload(animationSpriteArray) {
            let rotation = SKAction.animate(with: self.animationSpriteArray, timePerFrame: 0.05, resize: true, restore: false)
            let rotationForever = SKAction.repeatForever(rotation)
            self.run(rotationForever)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}













