//
//  GameProtocol.swift
//  Risky
//
//  Created by Danny Peng on 3/31/18.
//  Copyright © 2018 Danny Peng. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

protocol GameProtocol: class {
    func OpeningScene()
    func GameScene()
    func GameOver()
}
