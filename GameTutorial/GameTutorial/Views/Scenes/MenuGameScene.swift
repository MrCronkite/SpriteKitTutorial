//
//  MenuGameScene.swift
//  GameTutorial
//
//  Created by admin1 on 17.02.23.
//

import SpriteKit
import GameplayKit
import AVFAudio

class MenuGameScene: SKScene {
    
    var background = SKSpriteNode(imageNamed: "bgImage")
    var spriteImageGirl = SKSpriteNode(imageNamed: "girl")
    var buttonPlay = SKSpriteNode(imageNamed: "playBtn")
    var buttonLvl = SKSpriteNode(imageNamed: "levelsBtn")
    var buttonSong = SKSpriteNode(imageNamed: "songBtn")
    var buttonList = SKSpriteNode(imageNamed: "listBtn")
    var player = AVAudioPlayer()
    
    
    override func didMove(to view: SKView) {
        
        let bounds = UIScreen.main.bounds
        background.size = CGSize(width: bounds.size.width, height: bounds.size.height)
        background.zPosition = -4
        background.position = CGPoint(x: 0, y: 0)
        
        spriteImageGirl.size = CGSize(width: bounds.size.width / 2.5 , height: bounds.size.height)
        spriteImageGirl.position = CGPoint(x: (bounds.size.width/2 - bounds.size.width / 2.5*2), y: 0)
        spriteImageGirl.zPosition = -1
        
        buttonLvl.position = CGPoint(x: 0, y: -100)
        buttonLvl.name = "buttonLvl"
        buttonPlay.position = CGPoint(x: 0, y: -20)
        buttonPlay.name = "buttonPlay"
        buttonSong.position = CGPoint(x: (bounds.size.width/2-50), y: (bounds.size.height/2-50))
        buttonSong.size = CGSize(width: 40, height: 40)
        buttonSong.name = "song"
        buttonList.position = CGPoint(x: -(bounds.size.width/2-50), y: (bounds.size.height/2-50))
        buttonList.size = CGSize(width: 40, height: 40)
        buttonList.name = "list"
        
        addChild(buttonList)
        addChild(buttonSong)
        addChild(buttonLvl)
        addChild(buttonPlay)
        addChild(spriteImageGirl)
        addChild(background)
        
        do {
            if let audioPath = Bundle.main.path(forResource: "song", ofType: "mp3"){
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            }
        } catch {
            print("error")
        }
        
        //player.play()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes.reversed() {
                switch node.name {
                case "buttonPlay": openPlayScene()
                case "buttonLvl": openLvlScene()
                case "song": playSong()
                case "list": showPolitics()
                default: continue
                }
            }
        }
    }
    
    private func showPolitics() {
        print("list")
    }
    
    private func playSong(){
        if player.isPlaying {
            buttonSong.texture = SKTexture(imageNamed: "noSong")
            player.stop()
        } else {
            player.play()
            buttonSong.texture = SKTexture(imageNamed: "songBtn")
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
