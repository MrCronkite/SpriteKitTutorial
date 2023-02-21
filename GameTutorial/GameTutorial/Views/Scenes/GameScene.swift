//
//  GameScene.swift
//  GameTutorial
//
//  Created by admin1 on 15.02.23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var dictSprite = [String: CGPoint]()
    var sprite: SKNode!
    var timer: Timer!
    var timerLabelNode: SKLabelNode!
    var gameOverLabel: SKLabelNode!
    var time = 10
    var background = SKSpriteNode(imageNamed: "bgImage")
    var timeBar: SKSpriteNode!
    var lvlBar: SKSpriteNode!
    var spriteSwipe: SKSpriteNode!
    var nodeShow = SKSpriteNode(imageNamed: "7")
    var gameOverNode: SKSpriteNode!
    var grid: SKShapeNode!
    
    override func didMove(to view: SKView) {
        
        grid = (self.childNode(withName: "grid") as! SKShapeNode)
        nodeShow.physicsBody?.isDynamic = true
        nodeShow.zPosition = 1
        nodeShow.run(SKAction.fadeIn(withDuration: 0.5))
        nodeShow.size = CGSize(width: 130, height: 101)
        nodeShow.position = CGPoint(x:-130, y: -0)
        nodeShow.alpha = 0
        
        gameOverNode = (self.childNode(withName: "lose") as! SKSpriteNode)
        
        let bounds = UIScreen.main.bounds
        background.size = CGSize(width: bounds.size.width, height: bounds.size.height)
        background.zPosition = -4
        background.position = CGPoint(x: 0, y: 0)
        print(background.size)
        
        timeBar = (self.childNode(withName: "timeBar") as! SKSpriteNode)
        timeBar.position = CGPoint(x: 0, y: (bounds.size.height/2 - 22) )
        timeBar.zPosition = 2
        lvlBar = (self.childNode(withName: "lvlBar") as! SKSpriteNode)
        lvlBar.position = CGPoint(x: 0, y: -(bounds.size.height/2 - 22) )
        
        timerLabelNode = SKLabelNode(text: "10")
        timerLabelNode.position = CGPoint(x: 10, y: -9)
        timerLabelNode.zPosition = 3
        
        timeBar.addChild(timerLabelNode)
        addChild(background)
        
        
       // gameOverLabel.alpha = 0
        
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
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
    
    @objc func onTimerFires() {
        time -= 1
        timerLabelNode.text = "\(time)"
        
        if time <= 0 {
            timer.invalidate()
            timer = nil
            stopGame()
        }
    }
    
    @objc func swipeDown(sender: UISwipeGestureRecognizer) {
        guard sprite != nil else { return }
        let moveSprite = SKAction.move(by: CGVector(dx: 0, dy: -101), duration: 0.1)
        sprite.run(moveSprite)
    }
    
    @objc func swipeUp(sender: UISwipeGestureRecognizer) {
        guard sprite != nil else { return }
        let moveSprite = SKAction.move(by: CGVector(dx: 0, dy: 101), duration: 0.1)
        sprite.run(moveSprite)
    }

    @objc func swipeRight(sender: UISwipeGestureRecognizer) {
        guard sprite != nil else { return }
        let moveSprite = SKAction.move(by: CGVector(dx: 130, dy: 0), duration: 0.1)
        sprite.run(moveSprite)
    }
    
    @objc func swipeLeft(sender: UISwipeGestureRecognizer) {
        guard sprite != nil else { return }
        let moveSprite = SKAction.move(by: CGVector(dx: -130, dy: 0), duration: 0.1)
        sprite.run(moveSprite)
    }
    
    func stopGame() {
        gameOverNode.run(SKAction.fadeIn(withDuration: 0.5))
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
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
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dictSprite = ["sprite1": CGPoint(x: -260, y: 101), "sprite2": CGPoint(x: -130, y: 101), "sprite3": CGPoint(x:-0 , y: 101), "sprite4": CGPoint(x: 130, y: 101), "sprite5": CGPoint(x: 260, y: 101), "sprite6": CGPoint(x: -260, y: 0), "sprite7": CGPoint(x: -130, y: -0), "sprite8": CGPoint(x: 0, y: 0), "sprite9": CGPoint(x: 130, y: 0), "sprite10": CGPoint(x: 260, y: 0), "sprite11": CGPoint(x: -260, y: -101), "sprite12": CGPoint(x: -130, y: -101), "sprite13": CGPoint(x: 0, y: -101), "sprite14": CGPoint(x: 130, y: -101), "sprite15": CGPoint(x: 260, y: -101)]
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes.reversed() {
                if dictSprite[node.name ?? ""] != nil {
                    node.physicsBody?.pinned = false
                    self.sprite = node
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.sprite = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
            var item = 0
            for (key, value) in self.dictSprite {
                if let spriteSwipe = self.childNode(withName: key) as? SKSpriteNode {
                    let rageX = Int(value.x) - Int(round(spriteSwipe.position.x*10)/10)
                    let rageY = Int(value.y) - Int(round(spriteSwipe.position.y*10)/10)
                    if rageX >= -2 && rageX <= 2 && rageY >= -2 && rageY <= 2 {
                        item += 1
                    }
                }
            }
            item == 14 ? winningGame() : print("fff")
            guard sprite != nil else { return }
            sprite.physicsBody?.pinned = true
        }
    }
    
    func winningGame(){
        print("win")
        timer.invalidate()
        self.addChild(nodeShow)
        grid.alpha = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            if let view = self.view {
                if let scene = SKScene(fileNamed: "LevelsScene") {
                    let bounds = UIScreen.main.bounds
                    scene.size = CGSize(width: bounds.size.width, height: bounds.size.height)
                    scene.scaleMode = .aspectFill
                    view.presentScene(scene, transition: .moveIn(with: .down, duration: 1))
                }
                view.ignoresSiblingOrder = true
            }
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
