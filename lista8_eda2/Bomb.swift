//
//  Bomb.swift
//  lista8_eda2
//
//  Created by Matheus Azevedo on 02/12/18.
//  Copyright © 2018 Matheus Azevedo. All rights reserved.
//

import SpriteKit

class Bomb: SKSpriteNode {
    
    var visited: Bool
    var number: Int
    
    init() {
        visited = false
        number = -1
        super.init(texture: SKTexture(imageNamed: "fire"), color: .clear, size: CGSize(width: 30, height: 30))
        
        self.name = "CAIXA"

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func explode() {
        let emiter = SKEmitterNode(fileNamed: "Explosao.sks")
        //emiter?.particleTexture = SKTexture(imageNamed: )
        texture = nil
        
        emiter?.position = CGPoint(x: 0, y: 0)
        self.addChild(emiter!)
        
        emiter?.resetSimulation()
        
        //Matar asteróide da tela
        
        run(SKAction.wait(forDuration: 1)) {
            emiter?.removeFromParent()
            self.removeFromParent()
        }

    }
}
