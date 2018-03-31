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
import CoreGraphics

class OpeningScene : SKScene, SceneProtocol {
    
    var controller : GameProtocol!
    
    //TODO: Create play button to enter the game and a statistics button.
    var background = SKSpriteNode(imageNamed: "OpeningScene.jpg")
    
    func setController(controller : GameProtocol) {
        self.controller = controller
    }
    
    override func didMove(to view: SKView) {
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        self.addChild(background)
    }
    

}
