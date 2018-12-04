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
    
    var weight: Int
    var wLabel: SKLabelNode?
    
    init(_ number: Int, weight: Int = 0) {
        self.adjacentNumber = number
        self.point = SKShapeNode(circleOfRadius: 3)
        self.weight = weight
        
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
    
    func setWeightLabel() {
        self.wLabel = SKLabelNode(text: "\(self.weight)")
        wLabel?.position = middleLinePoint()
        wLabel?.fontColor = .white
        wLabel?.fontSize = 22
        
        self.addChild(wLabel!)
    }
    
    func middleLinePoint() -> CGPoint {
        let newX = min(startPoint.x, endPoint.x) + abs((startPoint.x-endPoint.x)/2)
        let newY = min(startPoint.y, endPoint.y) + abs((startPoint.y-endPoint.y)/2)

        return CGPoint(x: newX, y: newY)
    }
    
}
