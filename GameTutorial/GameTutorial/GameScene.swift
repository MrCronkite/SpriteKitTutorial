//
//  GameScene.swift
//  GameTutorial
//
//  Created by admin1 on 15.02.23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var currentNode: SKNode?
    
    override func didMove(to view: SKView) {
        if let grid = Grid(blockSize: 70.0, rows:5, cols:5) {
            grid.position = CGPoint (x:frame.midX, y:frame.midY)
            addChild(grid)
            
            let gamePiece = SKSpriteNode(imageNamed: "Spaceship")
            gamePiece.setScale(0.0625)
            gamePiece.position = grid.gridPosition(row: 1, col: 0)
            grid.addChild(gamePiece)
        }
        
        let node = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        node.name = "draggable"
        
        self.addChild(node)
        
        let blueNode = SKSpriteNode(color: .blue, size: CGSize(width: 50, height: 50))
        blueNode.name = "draggable"
        self.addChild(blueNode)
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
                if node.name == "draggable" {
                    self.currentNode = node
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let node = self.currentNode {
            let touchLocation = touch.location(in: self)
            node.position = touchLocation
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentNode = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentNode = nil
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
