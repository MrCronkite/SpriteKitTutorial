//
//  LevelsScene.swift
//  GameTutorial
//
//  Created by admin1 on 19.02.23.
//

import SpriteKit
import GameplayKit


class LevelsScene: SKScene{
    
    var boardCamera = SKCameraNode()
    var background = SKSpriteNode(imageNamed: "bgImage")
    
    override func didMove(to view: SKView) {
        
        boardCamera = self.childNode(withName: "boardCamera") as! SKCameraNode
        
        let bounds = UIScreen.main.bounds
        background.size = CGSize(width: bounds.size.width, height: bounds.size.height)
        background.zPosition = -4
        background.position = CGPoint(x: 0, y: 0)
        
        
        
        addChild(background)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            print(touch)
            let location = touch.location(in: self)
            let previousLocation = touch.previousLocation(in: self)
            let deltaY = location.y - previousLocation.y
            boardCamera.position.y += deltaY
        }
    }
}
