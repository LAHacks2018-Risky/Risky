//
//  Protagonist.swift
//  Risky
//
//  Created by Danny Peng on 3/31/18.
//  Copyright © 2018 Danny Peng. All rights reserved.
//

import SpriteKit

struct PhysicsCategory {
    static let none: UInt32 = 0
    static let Protagonist: UInt32 = 0b1
    static let Items: UInt32 = 0b10
    static let Enemy: UInt32 = 0b100
    static let Misc: UInt32 = 0b1000
}

class Protagonist: SKSpriteNode {
    
    static let maxHealth = 100
    var health = maxHealth
    
    
    init() {
        let texture = SKTexture(imageNamed: "foxPro")
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        name = "Protagonist"
//        This snippet animates the fox.
//        var textures = [SKTexture]()
//        for i in 1...5 {
//            textures.append(SKTexture(imageNamed: "Fox\(i)"))
//        }
        physicsBody = SKPhysicsBody(circleOfRadius: 25)
        physicsBody!.categoryBitMask = PhysicsCategory.Protagonist
        physicsBody!.contactTestBitMask = PhysicsCategory.Enemy | PhysicsCategory.Items
        physicsBody!.collisionBitMask = PhysicsCategory.none
        physicsBody!.affectedByGravity = false
        physicsBody!.allowsRotation = false
        zPosition = 6
//        let animate = SKAction.animateWithTextures(textures, timePerFrame: 0.2)
//        let animateForever = SKAction.repeatActionForever(animate)
//        runAction(animateForever)

    }
    
    func takeDamage(damage: Int) -> CGFloat {
        health -= damage
        return CGFloat(health)/CGFloat(Protagonist.maxHealth)
        
    }
    
    func isDead() -> Bool {
        return health <= 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
