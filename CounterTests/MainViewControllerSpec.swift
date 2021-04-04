//
//  MainViewControllerSpec.swift
//  CounterTests
//
//  Created by 永瀬拓也 on 2021/04/04.
//

import UIKit
import Quick
import Nimble
@testable import Counter

extension UIButton {
    func tap(repeat: Int = 1) {
        for _ in 1...`repeat` {
            self.sendActions(for: .touchUpInside)
        }
    }
}

class MainViewControllerSpec: QuickSpec {
    override func spec() {
        var vc: ViewController!
        
        beforeEach {
            vc = ViewController.make()
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = vc
            window.makeKeyAndVisible()
        }
        
        describe("初期表示") {
            it("カウントが「0」であること") {
                expect(vc.countLabel.text).to(equal("0"))
            }
            
            it("「-」ボタンが非活性であること") {
                expect(vc.decrementButton.isEnabled).to(beFalse())
            }
            
            it("「+」ボタンが活性であること") {
                expect(vc.incrementButton.isEnabled).to(beTrue())
            }
        }
        
        describe("「＋」ボタンを押した時のテスト") {
            context("初期値が「0」") {
                it("カウントが「1」になること") {
                    vc.incrementButton.tap()
                    expect(vc.countLabel.text).to(equal("1"))
                }
                
                it("カウントが0でなくなるので「-」ボタンが活性になること") {
                    vc.incrementButton.tap()
                    expect(vc.decrementButton.isEnabled).to(beTrue())
                }
            }
            
            context("カウンタが上限値になること") {
                beforeEach {
                    vc.incrementButton.tap(repeat: 10)
                }
                
                it("「+」ボタンが非活性になること") {
                    expect(vc.incrementButton.isEnabled).to(beFalse())
                }
            }
        }
        
        describe("「-」ボタンを押した時のテスト") {
            context("現在値が「1」") {
                beforeEach {
                    vc.incrementButton.tap()
                }
                
                it("カウンタが「0」になること") {
                    vc.decrementButton.tap()
                    expect(vc.countLabel.text).to(equal("0"))
                }
                
                it("カウンタが下限値なので「-」ボタンが非活性になること") {
                    vc.decrementButton.tap()
                    expect(vc.decrementButton.isEnabled).to(beFalse())
                }
            }
            
            context("現在地が上限値") {
                beforeEach {
                    vc.incrementButton.tap(repeat: 10)
                }
                
                it("「+」ボタンが活性になること") {
                    vc.decrementButton.tap()
                    expect(vc.incrementButton.isEnabled).to(beTrue())
                }
            }
        }
        
//        describe("現在値の保存") {
//            context("現在地が2") {
//                beforeEach {
//                    vc.incrementButton.tap(repeat: 2)
//                    UserDefaults.standard.set(0, forKey: "count")
//                }
//
//                context("「+」ボタンをタップ") {
//                    it("現在地「3」がUserDefaultsに保存されること") {
//                        vc.incrementButton.tap()
//                        expect(UserDefaults.standard.integer(forKey:"count")).to(equal(3))
//                    }
//                }
//
//                context("「-」ボタンをタップ") {
//                    it("現在地「1」がUserDefaultsに保存されること") {
//                        vc.decrementButton.tap()
//                        expect(UserDefaults.standard.integer(forKey:"count")).to(equal(1))
//                    }
//                }
//            }
//        }
    }
}
