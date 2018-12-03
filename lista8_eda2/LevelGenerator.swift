//
//  LevelGenerator.swift
//  lista8_eda2
//
//  Created by Matheus Azevedo on 02/12/18.
//  Copyright © 2018 Matheus Azevedo. All rights reserved.
//

import SpriteKit

class LevelGenerator {
    
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
    
}
