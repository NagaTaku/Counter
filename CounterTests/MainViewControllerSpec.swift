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
        }
        
        describe("「＋」ボタンを押した時のテスト") {
            context("初期値が「0」") {
                it("カウントが「1」になること") {
                    vc.incrementButton.sendActions(for: .touchUpInside)
                    expect(vc.countLabel.text).to(equal("1"))
                }
            }
        }
    }
}
