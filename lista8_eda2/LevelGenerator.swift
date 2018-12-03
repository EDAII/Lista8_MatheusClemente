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
    
    static func generateGraph0() -> Array<Array<Int>> {
        var adjacencyList = Array<Array<Int>>()
        
        for i in 0...9 {
            adjacencyList.append(Array<Int>())
            if i < 9 {
                adjacencyList[i].append(i+1)
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
    
    static func generateGraph1() -> Array<Array<Int>>{
        
        var adjacencyList = Array<Array<Int>>()

        adjacencyList.append([1,2])
        adjacencyList.append([3, 4])
        adjacencyList.append([5, 6])
        
        for _ in 1...4 {
            adjacencyList.append(Array<Int>())
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
    
    static func generateGraph2() -> Array<Array<Int>>{
        
        var adjacencyList = Array<Array<Int>>()
        
        for _ in 1...9 {
            adjacencyList.append(Array<Int>())
        }
        
        adjacencyList[0].append(contentsOf: [1,2,3,4,5,6,7,8])
        
        return adjacencyList
    }
    
}
