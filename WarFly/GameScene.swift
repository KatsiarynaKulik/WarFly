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

    var player: PlayerPlane!

    override func didMove(to view: SKView) {

        configureStartScene()
        spawnClouds()
        spawnIslands()
        let deadline = DispatchTime.now() + .nanoseconds(1)
        DispatchQueue.main.asyncAfter(deadline: deadline) { [unowned self] in
            self.player.performFly()
        }

        spawnPowerUp()
        spawnEnemy(count: 5)
    }

    fileprivate func spawnPowerUp() {
        let powerUp = PowerUp()
        powerUp.performRotation()
        powerUp.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        self.addChild(powerUp)
    }

    fileprivate func spawnEnemy(count: Int) {
        let enemyTextureAtlas = SKTextureAtlas(named: "Enemy_1")
        SKTextureAtlas.preloadTextureAtlases([enemyTextureAtlas]) {
            Enemy.textureAtlas = enemyTextureAtlas
            let waitAction = SKAction.wait(forDuration: 1.0)
            let spawnEnemy = SKAction.run({
                let enemy = Enemy()
                enemy.position = CGPoint(x: self.size.width / 2, y: self.size.height + 110)
                self.addChild(enemy)
                enemy.flySpiral()
            })

            let spawnAction = SKAction.sequence([waitAction, spawnEnemy])
            let repeatAction = SKAction.repeat(spawnAction, count: count)
            self.run(repeatAction)
        }

    }

    fileprivate func spawnClouds() {
        let spawnCloudWait = SKAction.wait(forDuration: 1)
        let spawnCloudAction = SKAction.run {
            let cloud = Cloud.populate(at: nil)
            self.addChild(cloud)
        }

        let spawnCloudSequence = SKAction.sequence([spawnCloudWait, spawnCloudAction])
        let spawnCloudForever = SKAction.repeatForever(spawnCloudSequence)
        run(spawnCloudForever)
    }

    fileprivate func spawnIslands() {
        let spawnIslandWait = SKAction.wait(forDuration: 2)
        let spawnIslandAction = SKAction.run {
            let island = Island.populate(at: nil)
            self.addChild(island)
        }

        let spawnIslandSequence = SKAction.sequence([spawnIslandWait, spawnIslandAction])
        let spawnIslandForever = SKAction.repeatForever(spawnIslandSequence)
        run(spawnIslandForever)
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


    }

    override func didSimulatePhysics() {


        player.checkPosition()

        enumerateChildNodes(withName: "sprite") { (node, stop) in
            if node.position.y < -100 {
                node.removeFromParent()
            }
        }
    }
}

















