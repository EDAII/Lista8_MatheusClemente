//
//  LevelGenerator.swift
//  lista8_eda2
//
//  Created by Matheus Azevedo on 02/12/18.
//  Copyright © 2018 Matheus Azevedo. All rights reserved.
//

import SpriteKit

class LevelGenerator {
    
    //MARK: - 0
    static func createBombs0 (size: CGSize) -> Array<Bomb>{
        var bombs = Array<Bomb>()
        
        for i in 1...10 {
            let box = Bomb()
            box.position = CGPoint(x: size.width/2, y: ((size.height/11) * CGFloat(i)))
            bombs.append(box)
            box.number = bombs.count - 1
        }
        
        return bombs
    }
    
    static func generateGraph0() -> Array<Array<GraphLine>> {
        var adjacencyList = Array<Array<GraphLine>>()
        
        for i in 0...9 {
            adjacencyList.append(Array<GraphLine>())
            if i < 9 {
                adjacencyList[i].append(GraphLine(i+1))
            }
        }
        return adjacencyList
    }
    
    //MARK: - 1
    static func createBombs1 (size: CGSize) -> Array<Bomb>{
        var bombs = Array<Bomb>()
        
        let box = Bomb()
        box.position = CGPoint(x: size.width/2, y: size.height*0.1)
        bombs.append(box)
        box.number = bombs.count - 1
        
        for i in 1...2 {
            let box = Bomb()
            box.position = CGPoint(x: CGFloat(i) * size.width/3, y: size.height*0.3)
            bombs.append(box)
            box.number = bombs.count - 1
        }
        
        for i in 1...4 {
            let box = Bomb()
            box.position = CGPoint(x: CGFloat(i) * size.width/5, y: size.height*0.5)
            bombs.append(box)
            box.number = bombs.count - 1
        }
        
        return bombs
    }
    
    static func generateGraph1() -> Array<Array<GraphLine>>{
        
        var adjacencyList = Array<Array<GraphLine>>()

        adjacencyList.append([GraphLine(1),GraphLine(2)])
        adjacencyList.append([GraphLine(3),GraphLine(4)])
        adjacencyList.append([GraphLine(5),GraphLine(6)])
        
        for _ in 1...4 {
            adjacencyList.append(Array<GraphLine>())
        }
        
        return adjacencyList
    }
    
    //MARK: - 2
    
    static func createBombs2 (size: CGSize) -> Array<Bomb>{
        var bombs = Array<Bomb>()
        
        let box = Bomb()
        box.position = CGPoint(x: size.width/2, y: size.height/2)
        bombs.append(box)
        box.number = bombs.count - 1
        
        for i in 1...2 {
            let box = Bomb()
            box.position = CGPoint(x: CGFloat(i) * size.width/3, y: size.height*0.8)
            bombs.append(box)
            box.number = bombs.count - 1
        }
        
        for i in 1...2 {
            let box = Bomb()
            if i == 1 {
                box.position = CGPoint(x: CGFloat(i) * size.width/5, y: size.height*0.6)
            } else {
                box.position = CGPoint(x: CGFloat(4) * size.width/5, y: size.height*0.6)
            }
            bombs.append(box)
            box.number = bombs.count - 1
        }
        
        for i in 1...2 {
            let box = Bomb()
            if i == 1 {
                box.position = CGPoint(x: CGFloat(i) * size.width/5, y: size.height*0.4)
            } else {
                box.position = CGPoint(x: CGFloat(4) * size.width/5, y: size.height*0.4)
            }
            bombs.append(box)
            box.number = bombs.count - 1
        }
        
        for i in 1...2 {
            let box = Bomb()
            box.position = CGPoint(x: CGFloat(i) * size.width/3, y: size.height*0.2)
            bombs.append(box)
            box.number = bombs.count - 1
        }
        
        return bombs
    }
    
    static func generateGraph2() -> Array<Array<GraphLine>>{
        
        var adjacencyList = Array<Array<GraphLine>>()
        
        for _ in 1...9 {
            adjacencyList.append(Array<GraphLine>())
        }
        for n in 1...8 {
            adjacencyList[0].append(GraphLine(n))
        }
        
        return adjacencyList
    }
    
    //MARK: - 3
    static func createBombs3 (size: CGSize) -> Array<Bomb>{
        var bombs = Array<Bomb>()
        
        for i in 1...2 {
            let box = Bomb()
            box.position = CGPoint(x: CGFloat(i) * size.width/3, y: size.height*0.8)
            bombs.append(box)
            box.number = bombs.count - 1
        }
        
        for i in 1...2 {
            let box = Bomb()
            if i == 1 {
                box.position = CGPoint(x: CGFloat(i) * size.width/5, y: size.height*0.6)
            } else {
                box.position = CGPoint(x: CGFloat(4) * size.width/5, y: size.height*0.6)
            }
            bombs.append(box)
            box.number = bombs.count - 1
        }
        
        for i in 1...2 {
            let box = Bomb()
            if i == 1 {
                box.position = CGPoint(x: CGFloat(i) * size.width/5, y: size.height*0.4)
            } else {
                box.position = CGPoint(x: CGFloat(4) * size.width/5, y: size.height*0.4)
            }
            bombs.append(box)
            box.number = bombs.count - 1
        }
        
        for i in 1...2 {
            let box = Bomb()
            box.position = CGPoint(x: CGFloat(i) * size.width/3, y: size.height*0.2)
            bombs.append(box)
            box.number = bombs.count - 1
        }
        
        return bombs
    }
    
    static func generateGraph3() -> Array<Array<GraphLine>>{
        
        var adjacencyList = Array<Array<GraphLine>>()
        
        for _ in 1...8 {
            adjacencyList.append(Array<GraphLine>())
        }
        for n in 0...7 {
            if n == 7 {
                adjacencyList[n].append(GraphLine(0))
            } else {
                adjacencyList[n].append(GraphLine(n+1))
            }
        }
        
        return adjacencyList
    }
    
    //MARK: - 4
    
    static func createBombsT (size: CGSize) -> Array<Bomb>{
        var bombs = Array<Bomb>()
        
        for _ in 1...8 {
            let box = Bomb()
            bombs.append(box)
            box.number = bombs.count - 1
        }
        
        bombs[0].position = CGPoint(x: size.width*0.2, y: size.height*0.1)
        bombs[1].position = CGPoint(x: size.width*0.1, y: size.height*0.25)
        bombs[2].position = CGPoint(x: size.width*0.1, y: size.height*0.85)
        bombs[3].position = CGPoint(x: size.width*0.5, y: size.height*0.75)
        bombs[4].position = CGPoint(x: size.width*0.55, y: size.height*0.5)
        bombs[5].position = CGPoint(x: size.width*0.4, y: size.height*0.3)
        bombs[6].position = CGPoint(x: size.width*0.9, y: size.height*0.2)
        bombs[7].position = CGPoint(x: size.width*0.9, y: size.height*0.85)

        
        return bombs
    }
    
    static func generateGraphT(withWeight: Bool = false) -> Array<Array<GraphLine>>{
        
        var adjacencyList = Array<Array<GraphLine>>()
        
        for _ in 0...7 {
            adjacencyList.append(Array<GraphLine>())
        }
        if !withWeight {
            adjacencyList[0] = [GraphLine(1), GraphLine(5), GraphLine(6)]
            adjacencyList[1] = [GraphLine(2)]
            adjacencyList[2] = [GraphLine(4), GraphLine(7)]
            adjacencyList[3] = [GraphLine(2), GraphLine(7)]
            adjacencyList[4] = [GraphLine(3), GraphLine(7)]
            adjacencyList[5] = [GraphLine(2), GraphLine(4), GraphLine(6)]
            adjacencyList[6] = [GraphLine(4), GraphLine(7)]
            adjacencyList[7] = []
        } else {
            adjacencyList[0] = [GraphLine(1, weight: 9), GraphLine(5, weight: 14), GraphLine(6, weight: 15)]
            adjacencyList[1] = [GraphLine(2, weight: 23)]
            adjacencyList[2] = [GraphLine(4, weight: 2), GraphLine(7, weight: 19)]
            adjacencyList[3] = [GraphLine(2, weight: 6), GraphLine(7, weight: 6)]
            adjacencyList[4] = [GraphLine(3, weight: 11), GraphLine(7, weight: 16)]
            adjacencyList[5] = [GraphLine(2, weight: 18), GraphLine(4, weight: 30), GraphLine(6, weight: 5)]
            adjacencyList[6] = [GraphLine(4, weight: 20), GraphLine(7, weight: 44)]
            adjacencyList[7] = []
        }
        

        
        return adjacencyList
    }
    
}
