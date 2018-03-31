//
//  GameScene.swift
//  Risky
//
//  Created by Danny Peng on 3/31/18.
//  Copyright © 2018 Danny Peng. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var hero: SKSpriteNode!
    var scrollLayer: SKNode!
    
    let fixedDelta: CFTimeInterval = 1.0/60.0 //60 FPS
    let scrollSpeed: CGFloat = 100
    
    override func didMove(to view: SKView) {
        
        hero = self.childNode(withName: "//heroNode") as! SKSpriteNode
    
        scrollLayer = self.childNode(withName: "scrollLayer")
        
    }
    
     override func update(_ currentTime: TimeInterval) {
        scrollWorld()
    }
    
    func scrollWorld() {
        scrollLayer.position.x -= scrollSpeed * CGFloat(fixedDelta)
        
        /* Loop through scroll layer nodes */
        for ground in scrollLayer.children as! [SKSpriteNode] {
            
            /* Get ground node position, convert node position to scene space */
            let groundPosition = scrollLayer.convert(ground.position, to: self)
            
            /* Check if ground sprite has left the scene */
            if groundPosition.x <= -ground.size.width / 2 {
                
                /* Reposition ground sprite to the second starting position */
                let newPosition = CGPoint(x: (self.size.width / 2) + ground.size.width, y: groundPosition.y)
                
                /* Convert new node position back to scroll layer space */
                ground.position = self.convert(newPosition, to: scrollLayer)
            }
        }
        
    }
}
