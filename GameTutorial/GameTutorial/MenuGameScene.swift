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
    var spriteImageGirl = SKSpriteNode(imageNamed: "girl")
    var buttonPlay = SKSpriteNode(imageNamed: "playBtn")
    var buttonLvl = SKSpriteNode(imageNamed: "levelsBtn")
    
    override func didMove(to view: SKView) {
        
        let bounds = UIScreen.main.bounds
        background.size = CGSize(width: bounds.size.width, height: bounds.size.height)
        background.zPosition = -4
        background.position = CGPoint(x: 0, y: 0)
    
        spriteImageGirl.size = CGSize(width: bounds.size.width / 2.7 , height: bounds.size.height)
        spriteImageGirl.position = CGPoint(x: -280, y: 0)
        
        buttonLvl.position = CGPoint(x: 0, y: -80)
        buttonPlay.position = CGPoint(x: 0, y: -20)
        
        addChild(buttonLvl)
        addChild(buttonPlay)
        addChild(spriteImageGirl)
        addChild(background)
        
        
    }
    
    
    
}
