//
//  GameViewController.swift
//  Risky
//
//  Created by Danny Peng on 3/31/18.
//  Copyright © 2018 Danny Peng. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController, GameProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        GameScene()
        }
    
    func OpeningScene() {
        if let theScene = SKScene(fileNamed: "OpeningScene") {
            massageScene(scene: theScene)
        }
    }
    
    func GameScene() {
        if let theScene = SKScene(fileNamed: "GameScene") {
            massageScene(scene: theScene)
        }
    }
    
    func GameOver() {
        if let theScene = SKScene(fileNamed: "GameOver") {
            massageScene(scene: theScene)
        }
    }
    
    
    func massageScene(scene: SKScene) {
        
        let skView = self.view as! SKView
        let ss = scene as? SceneProtocol
        ss?.setController(controller: self)
        
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.showsPhysics = false
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .resizeFill
        
        skView.presentScene(scene)
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
