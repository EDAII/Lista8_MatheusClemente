//
//  GameLayer.swift
//  lista8_eda2
//
//  Created by Matheus Azevedo on 02/12/18.
//  Copyright © 2018 Matheus Azevedo. All rights reserved.
//

import SpriteKit

class GameLayer: SKNode {
    
    var bombs: Array<Bomb>
    var adjacencyList: Array<Array<Int>>
    var burstQueue: Queue<Bomb>
    
    init(size: CGSize) {
        bombs = Array()
        adjacencyList = Array(Array())
        burstQueue = Queue<Bomb>()

        
        super.init()
        
        for i in 1...10 {
            let box = Bomb()
            box.position = CGPoint(x: size.width/2, y: ((size.height/11) * CGFloat(i)))
            self.addChild(box)
            bombs.append(box)
            box.number = bombs.count - 1
        }
        
        isUserInteractionEnabled = true
        testGraph()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: self) {
            for n in nodes(at: location) {
                if let b = n as? Bomb {
                    bfs(statingVertice: b.number)
                }
            }
        }
        
    }
    
    //MARK: - Graph management
    
    func testGraph(){
        for i in 0...9 {
            adjacencyList.append(Array<Int>())
            if i < 9 {
                adjacencyList[i].append(i+1)
            }
        }
    }
    
    func bfs(statingVertice: Int) {
        for b in bombs {
            b.visited = false
        }
        
        var toVisit = Queue<Int>()
        toVisit.push(statingVertice)
        bombs[statingVertice].visited = true
        //bombs[statingVertice].colorBlendFactor = 1
        burstQueue.push(bombs[statingVertice])
        
        while let newB = toVisit.pop() {
        
            for v in adjacencyList[newB] {
                if (!bombs[v].visited) {
                    bombs[v].visited = true
                    //bombs[v].colorBlendFactor = 1
                    burstQueue.push(bombs[v])

                    toVisit.push(v)
                }
            }
        }
        
        burstChain()
    }
    
    func burstChain() {
        if let b = burstQueue.pop() {
            b.explode()
        }
        print("BUMMM")
        run(SKAction.wait(forDuration: 0.5)) {
            if !self.burstQueue.isEmpty {
                self.burstChain()
            }
        }
    }
}
