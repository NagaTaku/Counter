//
//  MainViewControllerTests.swift
//  CounterTests
//
//  Created by 永瀬拓也 on 2021/04/04.
//

import XCTest
@testable import Counter

class MainViewControllerTests: XCTestCase{
    
    func testIncrementButton() {
        let vc = ViewController.make()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = vc
        window.makeKeyAndVisible()

        XCTAssertEqual(vc.countLabel.text, "0")
        vc.incrementButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(vc.countLabel.text, "1")

    }
}


