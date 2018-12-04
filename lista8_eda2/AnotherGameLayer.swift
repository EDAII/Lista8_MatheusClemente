//
//  AnotherGameLayer.swift
//  lista8_eda2
//
//  Created by Matheus Azevedo on 03/12/18.
//  Copyright © 2018 Matheus Azevedo. All rights reserved.
//

import SpriteKit

class AnotherGameLayer: SKNode {
    let size: CGSize
    var bombs: Array<Bomb>
    var adjacencyList: Array<Array<GraphLine>>
    var lines: Array<SKShapeNode>
    
    var initialNode: Int
    var finalNode: Int
    var selectedNode: Int
    
    init(size: CGSize, level: Int) {
        self.size = size
        bombs = Array()
        adjacencyList = Array(Array())
        lines = [SKShapeNode]()
        
        initialNode = 0
        finalNode = 8
        selectedNode = 0
        
        super.init()
        
        isUserInteractionEnabled = true
        
        switch level {
        case 5:
            bombs = LevelGenerator.createBombsT(size: size)
            adjacencyList = LevelGenerator.generateGraphT()
        default:
            break
        }
        
        drawGraphLines()
        
        for b in bombs {
            self.addChild(b)
        }
        //Destaca o node inicial
        bombs[initialNode].color = .red
        bombs[initialNode].colorBlendFactor = 0.7
        
        //Botao de retorno
        let returnButton = SKSpriteNode(texture: SKTexture(imageNamed: "backButton"), color: .clear, size: SKTexture(imageNamed: "backButton").size())
        returnButton.setScale(0.05)
        returnButton.position = CGPoint(x: size.width*0.9, y: size.height*0.97)
        returnButton.name = "returnButton"
        self.addChild(returnButton)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: self) {
            for n in nodes(at: location) {
                if let b = n as? Bomb {
                    tryToSelectRoute(to: b.number)
                } else if n.name == "returnButton" {
                    returnToMenu()
                }
            }
        }
        
    }
    
    func returnToMenu() {
        let nextScene = MenuScene(size: self.size)
        nextScene.scaleMode = .aspectFill
        
        self.scene?.view?.presentScene(nextScene)
    }
    
    func drawGraphLines() {
        var startIndex = 0
        for start in adjacencyList {
            for end in start {
                let linePath = CGMutablePath()
                linePath.addLines(between: [bombs[startIndex].position, bombs[end.adjacentNumber].position])
                let newLine = SKShapeNode(path: linePath)
                newLine.strokeColor = .red
                newLine.alpha = 0.3
                end.line = newLine
                end.startPoint = bombs[startIndex].position
                end.endPoint = bombs[end.adjacentNumber].position
                self.addChild(end)
                end.animateGraph()
                //lines.append(newLine)
            }
            startIndex += 1
        }
    }
    
    func tryToSelectRoute(to nodeNumber: Int){
        for conection in adjacencyList[selectedNode] {
            if nodeNumber == conection.adjacentNumber {
                selectedNode = nodeNumber
                bombs[selectedNode].color = .red
                bombs[selectedNode].colorBlendFactor = 0.7
                
                conection.line.alpha = 1
                return
            }
        }
    }
    
}
