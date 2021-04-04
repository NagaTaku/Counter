//
//  CounterStorageDefaults.swift
//  Counter
//
//  Created by 永瀬拓也 on 2021/04/04.
//

import Foundation

class CounterStorageDefaults: CounterStorage {
    func save(_ count: Int) {
        UserDefaults.standard.set(count, forKey: "count")
    }
    
    func get() -> Int {
        return UserDefaults.standard.integer(forKey: "count")
    }
}
