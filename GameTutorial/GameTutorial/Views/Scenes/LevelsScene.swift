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
    var scrolView: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        let bounds = UIScreen.main.bounds
        
        scrolView = SKSpriteNode(color: UIColor(cgColor: CGColor(red: 255, green: 255, blue: 255, alpha: 0.7)), size: CGSize(width: bounds.size.width / 1.7, height: bounds.size.height))
        scrolView.position = CGPoint(x: 0, y:  -(bounds.size.height / 2))
        
        
        boardCamera = self.childNode(withName: "boardCamera") as! SKCameraNode
        
    
        background.size = CGSize(width: bounds.size.width, height: bounds.size.height)
        background.zPosition = -4
        background.position = CGPoint(x: 0, y: 0)
        
        addChild(background)
        boardCamera.addChild(scrolView)
        
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
