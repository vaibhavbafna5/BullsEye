//
//  ViewController.swift
//  BullsEye
//
//  Created by Vaibhav Bafna on 10/2/17.
//  Copyright © 2017 Vaibhav Bafna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    var currentValue: Int = 0
    var targetValue: Int = 0
    var difference: Int = 0
    var score: Int = 0
    var round: Int = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        calculateDifference()
        let points: Int = 100 - difference
        score += points
        
        
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: "Hello World",
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        round = round + 1
        updateLabels()
    }
    
    func updateLabels() {
        targetValLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func calculateDifference() {
        difference = Swift.abs(currentValue - targetValue)
    }
    
    @IBAction func startOver() {
        score = 0
        round = 0
        startNewRound()
    }
    
}

