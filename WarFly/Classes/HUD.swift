//
//  HUD.swift
//  WarFly
//
//  Created by Katsiaryna Kulik  on 28.08.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import SpriteKit

class HUD: SKScene {
  let scoreBacground = SKSpriteNode(imageNamed: "scores")
  let scoreLabel = SKLabelNode(text: "10000")
  let menuButton = SKSpriteNode(imageNamed: "menu")
  let life1 = SKSpriteNode(imageNamed: "life")
  let life2 = SKSpriteNode(imageNamed: "life")
  let life3 = SKSpriteNode(imageNamed: "life")

  func configureUI(screenSice: CGSize) {
    scoreBacground.position = CGPoint(x: scoreBacground.size.width + 10, y: screenSice.height - scoreBacground.size.height / 2 - 10)
    scoreBacground.anchorPoint = CGPoint(x: 1.0, y: 0.5)
    scoreBacground.zPosition = 99
    addChild(scoreBacground)

    scoreLabel.horizontalAlignmentMode = .right
    scoreLabel.verticalAlignmentMode = .center
    scoreLabel.position = CGPoint(x: -10, y: 3)
    scoreLabel.zPosition = 100
    scoreLabel.fontName = "AmericanTypewriter-Bold"
    scoreLabel.fontSize = 30
    scoreBacground.addChild(scoreLabel)

    menuButton.position = CGPoint(x: 20, y: 20)
    menuButton.anchorPoint = CGPoint(x: 0.0, y: 0.0)
    menuButton.zPosition = 100
    addChild(menuButton)

    let lifes = [life1, life2, life3]
    for (index, life) in lifes.enumerated() {
      life.position = CGPoint(x: screenSice.width - CGFloat(index + 1) * (life.size.width + 3), y: 30)
      life.zPosition = 100
      life.anchorPoint = CGPoint(x: 0.0, y: 0.0)
      addChild(life)
    }
  }

}
