//
//  Counter.swift
//  Counter
//
//  Created by 永瀬拓也 on 2021/04/04.
//

import Foundation

class CounterStorageMock: CounterStorage {
    var latestSaveCount: Int?
    
    func save(_ count: Int) {
        latestSaveCount = count
    }
    
    func get() -> Int {
        return latestSaveCount ?? 0
    }
}

class Counter {
    private (set) var count: Int
    private let counterStorage: CounterStorage
    
    init(count: Int = 0, counterStorage: CounterStorage = CounterStorageDefaults()) {
        self.counterStorage = counterStorage
        self.count = count
    }
    var isLowerLimit: Bool { return count <= 0 }
    var isUpperLimit: Bool { return count >= 10 }
    
    func increment() {
        count += 1
        counterStorage.save(count)
    }
    
    func decrement() {
        count -= 1
        counterStorage.save(count)
    }
}
