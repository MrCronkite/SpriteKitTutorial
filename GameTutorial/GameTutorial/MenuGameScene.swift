//
//  MenuGameScene.swift
//  GameTutorial
//
//  Created by admin1 on 17.02.23.
//

import SpriteKit
import GameplayKit

class MenuGameScene: SKScene {
    
    var background = SKSpriteNode(imageNamed: "bgImage")
    
    override func didMove(to view: SKView) {
        
        let bounds = UIScreen.main.bounds
        //self.size = CGSize(width: bounds.size.width, height: bounds.size.height)
        background.size = CGSize(width: bounds.size.height, height: bounds.size.width)
        background.zRotation = .pi / 2
        background.zPosition = -4
        background.position = CGPoint(x: 0, y: 0)
        print(background.size)
        addChild(background)
        
        
    }
    
}
