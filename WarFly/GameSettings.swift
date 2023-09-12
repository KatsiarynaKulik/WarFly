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

  var highscore: [Int] = []
  var currentScore = 0
  let highscoreKey = "highscore"

    override init() {
        super.init()

        loadGameSettings()
      loadScores()
    }

  func saveScores() {
    

  }

  func loadScores() {

  }

    func saveGameSettings() {
        ud.set(isMusic, forKey: musicKey)
        ud.set(isSound, forKey: soundKey)
    }

    func loadGameSettings() {
        guard ud.value(forKey: musicKey) != nil && ud.value(forKey: soundKey) != nil else { return }
        isMusic = ud.bool(forKey: musicKey)
        isSound = ud.bool(forKey: soundKey)
    }
}
