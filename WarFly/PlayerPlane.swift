//
//  PlayerPlane.swift
//  WarFly
//
//  Created by Katsiaryna Kulik  on 01.08.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import SpriteKit
import CoreMotion

class PlayerPlane: SKSpriteNode {

  let motionManager = CMMotionManager()
  var xAcceleration: CGFloat = 0
  let screenSice = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
  
    static func populate(at point: CGPoint) -> PlayerPlane {
        let playerPlaneTexture = SKTexture(imageNamed: "airplane_3ver2_13")
        let playerPlane = PlayerPlane(texture: playerPlaneTexture)
        playerPlane.setScale(0.5)
        playerPlane.position = point
        playerPlane.zPosition = 20
        return playerPlane
    }

  func checkPosition() {
    self.position.x += xAcceleration * 50

    if self.position.x < -70 {
      self.position.x = screenSice.width + 70
    } else if self.position.x > screenSice.width + 70 {
      self.position.x = -70
    }

  }

  func performFly() {

    motionManager.accelerometerUpdateInterval = 0.2
    motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
        if let data = data {
            let acceleration = data.acceleration
            self.xAcceleration = CGFloat(acceleration.x) * 0.7 + self.xAcceleration * 0.3
        }
    }
  }
}
