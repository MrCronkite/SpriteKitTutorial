//
//  MenuGameScene.swift
//  GameTutorial
//
//  Created by admin1 on 17.02.23.
//

import SpriteKit
import GameplayKit

class MenuGameScene: SKScene {
    
    var spriteLvl1: SKNode!
    
    override func didMove(to view: SKView) {
        
        spriteLvl1 = childNode(withName: "lvl1")
        
    }
    
}
