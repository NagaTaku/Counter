//
//  CounterSpec.swift
//  CounterTests
//
//  Created by 永瀬拓也 on 2021/04/04.
//

import Nimble
import Quick
@testable import Counter

class CounterSpec: QuickSpec {
    override func spec() {
        describe("#init") {
            context("引数なしで初期化") {
                it("countが0であること") {
                    let counter = Counter()
                    expect(counter.count).to(equal(0))
                }
            }
            
            context("引数ありで初期化") {
                it("countが引数の値であること") {
                    let counter = Counter(count: 3)
                    expect(counter.count).to(equal(3))
                }
            }
        }
        
        describe("#increment / #decrement") {
            context("現在地が「5」") {
                var counter: Counter!
                
                beforeEach {
                    counter = Counter(count: 5)
                }
                it("incrementすると6になる") {
                    counter.increment()
                    expect(counter.count).to(equal(6))
                }
                
                it("decrementすると4になる") {
                    counter.decrement()
                    expect(counter.count).to(equal(4))
                }
            }
        }
        
        describe("#isLowerLimit") {
            context("現在地が下限値") {
                it("trueを返すこと") {
                    expect(Counter(count: 0).isLowerLimit).to(beTrue())
                }
            }
            
            context("現在地が1") {
                it("falseを返すこと") {
                    expect(Counter(count: 1).isLowerLimit).to(beFalse())
                }
            }
        }
        
        describe("#isUpperLimit") {
            context("現在地が上限値") {
                it("trueを返すこと") {
                    expect(Counter(count: 10).isUpperLimit).to(beTrue())
                }
            }
            
            context("現在地が9") {
                it("falseを返すこと") {
                    expect(Counter(count: 9).isUpperLimit).to(beFalse())
                }
            }
        }
    }
}
