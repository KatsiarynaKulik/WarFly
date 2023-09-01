//
//  BestScene.swift
//  WarFly
//
//  Created by Katsiaryna Kulik  on 31.08.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import SpriteKit

class BestScene: ParentScene {

    var places = [10, 100, 10000]

    override func didMove(to view: SKView) {

        setHeader(withName: "best", andBackground: "header_background")

        let titles = ["back"]

        for (index, title) in titles.enumerated() {
            let button = ButtonNode(titled: title, backgroundName: "button_background")
            button.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 200 + CGFloat(100 * index))
            button.name = title
            button.label.name = title
            addChild(button)
        }

        let topPlaces = places.sorted { $0 > $1 }.prefix(3)
        for (index, value) in topPlaces.enumerated() {
            let l = SKLabelNode(text: value.description)
            l.fontColor = UIColor(red: 219 / 255, green: 226 / 255, blue: 215 / 255, alpha: 1.0)
            l.fontName = "AmericanTypewriter-Bold"
            l.fontSize = 30
            l.position = CGPoint(x: self.frame.midX, y: self.frame.midY - CGFloat(index * 60))
            addChild(l)
        }
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)

        if node.name == "back" {
            let transition = SKTransition.crossFade(withDuration: 1.0)
            guard let backScene = backScene else { return }
            backScene.scaleMode = .aspectFill
            self.scene!.view?.presentScene(backScene, transition: transition)
        }
    }

}
