//
//  GameScene.swift
//  GameTutorial
//
//  Created by admin1 on 15.02.23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var move = -50
    var sprite: SKNode!
    
    override func didMove(to view: SKView) {
        
       // sprite1 = self.childNode(withName: "sprite1")
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
                       
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes.reversed() {
                self.sprite = node
            }
        }
        
    }
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.move *= -1
        let moveSprite = SKAction.move(by: CGVector(dx: self.move, dy: 0), duration: 1)
        sprite.physicsBody?.pinned = false
        sprite.run(moveSprite)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print(contact)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
