//
//  Counter.swift
//  Counter
//
//  Created by 永瀬拓也 on 2021/04/04.
//

import Foundation

class Counter {
    private (set) var count: Int
    
    init(count: Int = 0) {
        self.count = count
    }
    var isLowerLimit: Bool { return count <= 0 }
    var isUpperLimit: Bool { return count >= 10 }
    
    func increment() {
        count += 1
    }
    
    func decrement() {
        count -= 1
    }
}
