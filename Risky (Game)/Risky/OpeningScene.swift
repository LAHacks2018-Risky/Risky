//
//  OpeningScene.swift
//  Risky
//
//  Created by Danny Peng on 3/31/18.
//  Copyright © 2018 Danny Peng. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class OpeningScene : SKScene, SceneProtocol {
    
    var controller : GameProtocol!
    
    func setController(controller : GameProtocol) {
        self.controller = controller
    }
}
