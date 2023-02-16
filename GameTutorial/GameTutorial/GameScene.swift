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
        
        let swipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        let swipeLeft: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        let swipeUp: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeUp))
        let swipeDown: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown))
        
        
        swipeRight.direction = .right
        swipeLeft.direction = .left
        swipeUp.direction = .up
        swipeDown.direction = .down
        
        view.addGestureRecognizer(swipeUp)
        view.addGestureRecognizer(swipeDown)
        view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(swipeRight)
        
    }
    
    @objc func swipeDown(sender: UISwipeGestureRecognizer) {
        let moveSprite = SKAction.move(by: CGVector(dx: 0, dy: -50), duration: 0.2)
        sprite.run(moveSprite)
        //sprite.physicsBody?.pinned = true
        
    }
    
    @objc func swipeUp(sender: UISwipeGestureRecognizer) {
        let moveSprite = SKAction.move(by: CGVector(dx: 0, dy: 50), duration: 0.2)
        sprite.run(moveSprite)
        //sprite.physicsBody?.pinned = true
    }

    @objc func swipeRight(sender: UISwipeGestureRecognizer) {
        let moveSprite = SKAction.move(by: CGVector(dx: 50, dy: 0), duration: 0.2)
        sprite.run(moveSprite)
        //sprite.physicsBody?.pinned = true
    }
    
    @objc func swipeLeft(sender: UISwipeGestureRecognizer) {
        let moveSprite = SKAction.move(by: CGVector(dx: -50, dy: 0), duration: 0.2)
        sprite.run(moveSprite)
        //sprite.physicsBody?.pinned = true
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
                if node.name == "sprite" {
                    node.physicsBody?.pinned = false
                    self.sprite = node
                    
                }
            }
        }
        
    }
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.sprite = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("konec")
        //self.sprite.physicsBody?.pinned = true
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
