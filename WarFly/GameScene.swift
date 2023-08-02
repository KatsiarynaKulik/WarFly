//
//  GameScene.swift
//  WarFly
//
//  Created by Katsiaryna Kulik  on 24.07.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {

    let motionManager = CMMotionManager()
    var xAcceleration: CGFloat = 0
    var player: SKSpriteNode!

    override func didMove(to view: SKView) {

      configureStartScene()
    }

  fileprivate func configureStartScene() {
    let screenCenterPoint = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
    let background = Background.populateBackground(at: screenCenterPoint)
    background.size = self.size
    self.addChild(background)

    let screen = UIScreen.main.bounds

    let island1 = Island.populate(at: CGPoint(x: 100, y: 200))
        self.addChild(island1)

    let island2 = Island.populate(at: CGPoint(x: self.size.width - 100, y: self.size.height - 200))
    self.addChild(island2)

    player = PlayerPlane.populate(at: CGPoint(x: screen.size.width / 2, y: 100))
    self.addChild(player)

    motionManager.accelerometerUpdateInterval = 0.2
    motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
        if let data = data {
            let acceleration = data.acceleration
            self.xAcceleration = CGFloat(acceleration.x) * 0.7 + self.xAcceleration * 0.3
        }
    }
  }

    override func didSimulatePhysics() {
        super.didSimulatePhysics()

        player.position.x += xAcceleration * 50

        if player.position.x < -70 {
            player.position.x = self.size.width + 70
        } else if player.position.x > self.size.width + 70 {
            player.position.x = -70
        }
    }
}

















