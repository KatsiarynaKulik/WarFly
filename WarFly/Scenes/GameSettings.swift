//
//  GameSettings.swift
//  WarFly
//
//  Created by Katsiaryna Kulik  on 10.09.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//


import UIKit

class GameSettings: NSObject {

  let ud = UserDefaults.standard

  var isMusic = true
  var isSound = true

  let musicKey = "music"
  let soundKey = "sound"

  override init() {
    super.init()
  }

  func saveGameSettings() {
    ud.set(isMusic, forKey: musicKey)
    ud.set(isSound, forKey: soundKey)
  }

  func loadGameSettinds() {

  }

}
