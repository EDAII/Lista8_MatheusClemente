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
        super.init(texture: SKTexture(), color: .red, size: CGSize(width: 20, height: 20))
        
        self.name = "CAIXA"

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
