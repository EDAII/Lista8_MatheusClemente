//
//  MenuScene.swift
//  lista8_eda2
//
//  Created by Matheus Azevedo on 02/12/18.
//  Copyright © 2018 Matheus Azevedo. All rights reserved.
//

import SpriteKit

class MenuButton: SKSpriteNode {
    let number: Int
    init(n: Int) {
        number = n
        super.init(texture: SKTexture(), color: .white, size: CGSize(width: 50, height: 50))
        
        self.colorBlendFactor = 1
        let label = SKLabelNode(text: "\(number+1)")
        label.fontColor = .black
        label.fontSize = 22
        addChild(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MenuScene: SKScene {
    
    override init(size: CGSize) {
        super.init(size: size)
        
        for i in 1...3 {
            let button = MenuButton(n: i-1)
            button.position = CGPoint(x: CGFloat(i) * size.width/4, y: size.height*0.7)
            self.addChild(button)
        }
        
        for i in 1...3 {
            let button = MenuButton(n:i+2)
            button.position = CGPoint(x: CGFloat(i) * size.width/4, y: size.height*0.5)
            self.addChild(button)
        }
        
      
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func openLevel(_ n: Int) {
        let nextScene = GameScene(size: self.size, level: n)
        nextScene.scaleMode = .aspectFill
        
        self.scene?.view?.presentScene(nextScene)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: self) {
            for n in nodes(at: location) {
                if let b = n as? MenuButton {
                    openLevel(b.number)
                }
            }
        }
    }
    
}
