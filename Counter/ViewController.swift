//
//  ViewController.swift
//  Counter
//
//  Created by 永瀬拓也 on 2021/04/04.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var incrementButton: UIButton!
    
    var counter = Counter()
    
    static func make() -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard
            .instantiateInitialViewController() as! ViewController
    }
    
    @IBAction func tapDecrementButton(_ sender: Any) {
        counter.decrement()
        updateView()
    }
    
    @IBAction func tapIncrementButton(_ sender: Any) {
        counter.increment()
        updateView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    private func updateView() {
        countLabel.text = "\(counter.count)"
        decrementButton.isEnabled = !counter.isLowerLimit
        incrementButton.isEnabled = !counter.isUpperLimit
    }


}

