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
    var selectedPath: Path
    
    init(size: CGSize, level: Int) {
        self.size = size
        bombs = Array()
        adjacencyList = Array(Array())
        lines = [SKShapeNode]()
        
        initialNode = 0
        finalNode = 7
        selectedNode = 0
        selectedPath = Path(to: initialNode)
        
        super.init()
        
        isUserInteractionEnabled = true
        
        switch level {
        case 5:
            bombs = LevelGenerator.createBombsT(size: size)
            adjacencyList = LevelGenerator.generateGraphT(withWeight: true)
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
        
        //Destaca o node final
        bombs[finalNode].color = .blue
        bombs[finalNode].colorBlendFactor = 0.7
        
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
                
                //Peso
                end.setWeightLabel()
                
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
        
                let newPath = Path(to: selectedNode, via: conection, previousPath: selectedPath)
                self.selectedPath = newPath
           
                if selectedNode == finalNode {
                    let bestPath = shortestPath(source: self.initialNode, destination: self.finalNode)
                    
                    print("\(bestPath?.cumulativeWeight)")
                    print("\(selectedPath.cumulativeWeight)")
                    
                    if bestPath?.cumulativeWeight == selectedPath.cumulativeWeight {
                        //Voce ganhou o jogo
                        youWin()
                    } else {
                        //Voce perdeu
                    }
                }
                
                return
            }
        }
    }
    
    class Path {
        public let cumulativeWeight: Int
        public let node: Int
        public let previousPath: Path?
        public let originLine: GraphLine?
        
        init(to node: Int, via line: GraphLine? = nil, previousPath path: Path? = nil) {
            if
                let previousPath = path,
                let viaLine = line {
                self.cumulativeWeight = viaLine.weight + previousPath.cumulativeWeight
            } else {
                self.cumulativeWeight = 0
            }
            
            self.node = node
            self.previousPath = path
            self.originLine = line
        }
    }
    
    func shortestPath(source: Int, destination: Int) -> Path? {
        
        
        var frontier: [Path] = [] {
            didSet { frontier.sort { return $0.cumulativeWeight < $1.cumulativeWeight } } // the frontier has to be always ordered
        }
        
        frontier.append(Path(to: source)) // the frontier is made by a path that starts nowhere and ends in the source
        
        while !frontier.isEmpty {
            let cheapestPathInFrontier = frontier.removeFirst() // getting the cheapest path available
            guard !bombs[cheapestPathInFrontier.node].visited else { continue } // making sure we haven't visited the node already
            
            if cheapestPathInFrontier.node == destination {
                return cheapestPathInFrontier // found the cheapest path 😎
            }
            
            bombs[cheapestPathInFrontier.node].visited = true
            
            for line in  adjacencyList[cheapestPathInFrontier.node] where !bombs[line.adjacentNumber].visited { // adding new paths to our frontier
                frontier.append(Path(to: line.adjacentNumber, via: line, previousPath: cheapestPathInFrontier))
            }
        } // end while
        return nil // we didn't find a path 😣
    }
    
    
    func youWin() {
        trinPath(selectedPath)
    }
    private func trinPath(_ path: Path) {
        bombs[path.node].color = .green
        if path.originLine != nil {
            path.originLine?.line.strokeColor = .green
            trinPath(path.previousPath!)
        }
    }
}
