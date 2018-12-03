//
//  GameLayer.swift
//  lista8_eda2
//
//  Created by Matheus Azevedo on 02/12/18.
//  Copyright © 2018 Matheus Azevedo. All rights reserved.
//

import SpriteKit

class GameLayer: SKNode {
    
    let size: CGSize
    var bombs: Array<Bomb>
    var adjacencyList: Array<Array<Int>>
    var burstQueue: Queue<Array<Bomb>>
    var lines: Array<SKShapeNode>
    
    init(size: CGSize, level: Int) {
        self.size = size
        bombs = Array()
        adjacencyList = Array(Array())
        burstQueue = Queue<Array<Bomb>>()
        lines = [SKShapeNode]()
        
        super.init()
        
        isUserInteractionEnabled = true
        
        switch level {
        case 0:
            bombs = LevelGenerator.createBombs0(size: size)
            adjacencyList = LevelGenerator.generateGraph0()
        case 1:
            bombs = LevelGenerator.createBombs1(size: size)
            adjacencyList = LevelGenerator.generateGraph1()
        case 2:
            bombs = LevelGenerator.createBombs2(size: size)
            adjacencyList = LevelGenerator.generateGraph2()
        default:
            break
        }
        
        drawGraphLines()
        
        for b in bombs {
            self.addChild(b)
        }
        
        
        //Botao de retorno
        let returnButton = SKSpriteNode(texture: SKTexture(imageNamed: "backButton"), color: .clear, size: SKTexture(imageNamed: "backButton").size())
        returnButton.setScale(0.05)
        returnButton.position = CGPoint(x: size.width*0.9, y: size.height*0.9)
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
                    bfs(statingVertice: b.number)
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
    
    //MARK: - Graph management
    func bfs(statingVertice: Int) {
        for b in bombs {
            b.visited = false
        }
        
        var toVisit = Queue<Int>()
        toVisit.push(statingVertice)
        bombs[statingVertice].visited = true
        //bombs[statingVertice].colorBlendFactor = 1
        burstQueue.push(Array([bombs[statingVertice]]))
        
        while let newB = toVisit.pop() {
            var newArray = Array<Bomb> ()
            for v in adjacencyList[newB] {
                if (!bombs[v].visited) {
                    bombs[v].visited = true
                    //bombs[v].colorBlendFactor = 1
                    newArray.append(bombs[v])
                    toVisit.push(v)
                }
            }
            burstQueue.push(newArray)
        }
        
        burstChain()
    }
    
    func drawGraphLines() {
        var startIndex = 0
        for start in adjacencyList {
            for end in start {
                let linePath = CGMutablePath()
                linePath.addLines(between: [bombs[startIndex].position, bombs[end].position])
                let newLine = SKShapeNode(path: linePath)
                newLine.strokeColor = .red
                newLine.alpha = 0.3
                self.addChild(newLine)
                lines.append(newLine)
            }
            startIndex += 1
        }
    }
    
    func burstChain() {
        if let bs = burstQueue.pop() {
            for b in bs {
                b.explode()
            }
        }
        print("BUMMM")
        run(SKAction.wait(forDuration: 0.5)) {
            if !self.burstQueue.isEmpty {
                self.burstChain()
            }
        }
    }
}
