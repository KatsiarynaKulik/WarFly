//
//  GreenPowerUp.swift
//  WarFly
//
//  Created by Katsiaryna Kulik  on 21.08.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import SpriteKit

class GreenPowerUp: PowerUp {

    init() {
        let textureAtlas = Assets.shared.greenPowerUpAtlas
        super.init(textureAtlas: textureAtlas)
        name = "greenPowerUp"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
