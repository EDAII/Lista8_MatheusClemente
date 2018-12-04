//
//  GameScene.swift
//  lista8_eda2
//
//  Created by Matheus Azevedo on 02/12/18.
//  Copyright © 2018 Matheus Azevedo. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let gameLayer: GameLayer
    let gameLayer2: AnotherGameLayer
    
    init(size: CGSize, level: Int) {
        
        self.gameLayer = GameLayer(size: size, level: level)
        self.gameLayer2 = AnotherGameLayer(size: size, level: level)
        
        super.init(size: size)
        if level < 5 {
            addChild(gameLayer)
        } else {
            addChild(gameLayer2)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        

    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
