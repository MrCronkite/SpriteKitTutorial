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
        
        buttonLvl.position = CGPoint(x: 0, y: -100)
        buttonLvl.name = "buttonLvl"
        buttonPlay.position = CGPoint(x: 0, y: -20)
        buttonPlay.name = "buttonPlay"
        
        addChild(buttonLvl)
        addChild(buttonPlay)
        addChild(spriteImageGirl)
        addChild(background)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
                       
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes.reversed() {
                switch node.name {
                case "buttonPlay": openPlayScene()
                case "buttonLvl": openLvlScene()
                default: continue
                }
            }
        }
    }
    
    private func openPlayScene() {
        let scale = SKAction.scale(to: 0.9, duration: 0.1)
        let sequence = SKAction.sequence([scale])
        buttonPlay.run(sequence)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
        if let view = self.view {
            if let scene = SKScene(fileNamed: "GameScene") {
                let bounds = UIScreen.main.bounds
                scene.size = CGSize(width: bounds.size.width, height: bounds.size.height)
                scene.scaleMode = .aspectFill
                
                view.presentScene(scene, transition: .moveIn(with: .right, duration: 1))
            }
            
            view.ignoresSiblingOrder = true
        }
    }
    }
    
    private func openLvlScene() {
        if let view = self.view {
            if let scene = SKScene(fileNamed: "LevelsScene") {
                let bounds = UIScreen.main.bounds
                scene.size = CGSize(width: bounds.size.width, height: bounds.size.height)
                scene.scaleMode = .aspectFill
              
                view.presentScene(scene, transition: .moveIn(with: .right, duration: 1))
            }
            
            view.ignoresSiblingOrder = true
        }
    }

    
}
