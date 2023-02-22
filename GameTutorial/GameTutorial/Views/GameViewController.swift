//
//  GameViewController.swift
//  GameTutorial
//
//  Created by admin1 on 15.02.23.
//

import UIKit
import SpriteKit
import GameplayKit
import FBSDKCoreKit
import FBSDKCoreKit_Basics
import FBAEMKit

class GameViewController: UIViewController {
    
    let appsflyerKey = "KdeD7D78mvpiqkaqFLATn7"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //AppEvents.logEvent()
        if let view = self.view as! SKView? {
            if let scene = SKScene(fileNamed: "MenuGameScene") {
                scene.scaleMode = .aspectFill
                let bounds = UIScreen.main.bounds
                scene.size = CGSize(width: bounds.size.width, height: bounds.size.height)
                
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
