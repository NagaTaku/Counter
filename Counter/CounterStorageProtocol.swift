//
//  CounterStorageProtocol.swift
//  Counter
//
//  Created by 永瀬拓也 on 2021/04/04.
//

protocol CounterStorage {
    func save(_ count: Int)
    func get() -> Int
}
