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
    var buttonBackNode = SKSpriteNode(imageNamed: "backPage")
   // var starNode: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        let bounds = UIScreen.main.bounds
        
        scrolView = SKSpriteNode(color: UIColor(cgColor: CGColor(red: 255, green: 255, blue: 255, alpha: 0.7)), size: CGSize(width: bounds.size.width / 1.7, height: bounds.size.height))
        scrolView = SKSpriteNode(imageNamed: "as")
        scrolView.position = CGPoint(x: 0, y:  -(bounds.size.height / 2))
        
        boardCamera = self.childNode(withName: "boardCamera") as! SKCameraNode
        buttonBackNode.position = CGPoint(x: -(bounds.size.width/2-50), y: (bounds.size.height/2-50))
        buttonBackNode.size = CGSize(width: 30, height: 30)
        buttonBackNode.name = "back"
        buttonBackNode.zPosition = 2
        
        background.size = CGSize(width: bounds.size.width, height: bounds.size.height)
        background.zPosition = -4
        background.position = CGPoint(x: 0, y: 0)
        
        addChild(background)
        addChild(buttonBackNode)
        boardCamera.addChild(scrolView)
        
        if let star = boardCamera.childNode(withName: "star1") as? SKSpriteNode{
            let score = UserDefaults.standard.integer(forKey: scoreGame)
            if score == 3 {
                star.texture = SKTexture(imageNamed: "starWin")
            }
        }
        
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes.reversed() {
                if node.name == "back"{
                    openMenu()
                }
                }
            }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let previousLocation = touch.previousLocation(in: self)
            let deltaY = location.y - previousLocation.y
            boardCamera.position.y += deltaY
        }
    }
    
    
    func openMenu(){
        if let view = self.view {
            if let scene = SKScene(fileNamed: "MenuGameScene") {
                let bounds = UIScreen.main.bounds
                scene.size = CGSize(width: bounds.size.width, height: bounds.size.height)
                scene.scaleMode = .aspectFill

                view.presentScene(scene, transition: .moveIn(with: .down, duration: 1))
            }
            view.ignoresSiblingOrder = true
        }
    }
    
    //MARK: - Private Key
    private let scoreGame = "GameScene"
    private let scoreGame2 = "Lvl2Scene"
}
