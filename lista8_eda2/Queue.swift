//
//  Queue.swift
//  lista8_eda2
//
//  Created by Matheus Azevedo on 02/12/18.
//  Copyright © 2018 Matheus Azevedo. All rights reserved.
//

import Foundation

struct Queue<T> {
    var list = [T]()
    
    mutating func push(_ element: T) {
        list.append(element)
    }
    mutating func pop() -> T? {
        if !list.isEmpty {
            return list.removeFirst()
        } else {
            return nil
        }
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
}
