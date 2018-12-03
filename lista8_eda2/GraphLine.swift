//
//  GraphLine.swift
//  lista8_eda2
//
//  Created by Matheus Azevedo on 03/12/18.
//  Copyright © 2018 Matheus Azevedo. All rights reserved.
//

import SpriteKit

class GraphLine: SKNode {
    let adjacentNumber: Int
    var line: SKShapeNode!
    let point: SKShapeNode
    var startPoint: CGPoint!
    var endPoint: CGPoint!
    
    init(_ number: Int) {
        self.adjacentNumber = number
        self.point = SKShapeNode(circleOfRadius: 3)
        
        super.init()
        
        point.fillColor = .orange
        point.strokeColor = .red
        point.alpha = 0.3
        self.addChild(point)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateGraph() {
        self.addChild(line)
        
        let reset = SKAction.run {
            self.point.position = self.startPoint
        }
        let move = SKAction.move(to: endPoint, duration: 1)
        
        let movementLoop = SKAction.repeatForever(SKAction.sequence([reset, move]))
        point.run(movementLoop, withKey: "movementLoop")
    }
    
}
