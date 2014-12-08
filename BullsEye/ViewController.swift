//
//  ViewController.swift
//  BullsEye
//
//  Created by Austen Allred on 12/8/14.
//  Copyright (c) 2014 Austen Allred. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        
        
        var title = "Bullseye?"
        if difference == 0 {
            title = "BULLSEYE! You get 100 bonus points!"
            points += 100
        }
        else if difference == 1 {
            title = "Oh man, only one off! 50 bonus points!"
            points += 50
        }
        else if difference < 5 {
            title = "You almost had it!"
        }
        else if difference < 10 {
            title = "Not bad"
        }
        else {
            title = "Not even close..."
        }
        
        score += points
        
        round += 1
        
        let message = "You said: \(currentValue)" + "\nYou were trying for: \(targetValue)" + "\nYou were \(difference) off" + "\nYou scored \(points) points"

        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        println("The value of the slider is now: \(lroundf(slider.value))")
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        println(targetValue)
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

