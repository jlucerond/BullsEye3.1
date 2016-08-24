//
//  ViewController.swift
//  BullsEye3.1
//
//  Created by Joe Lucero on 8/18/16.
//  Copyright © 2016 Joe Lucero. All rights reserved.
//

// digital pages 86-96

import UIKit

class ViewController: UIViewController {
    
    // variables
    var currentValue: Int = 0
    var targetValue: Int = 0
    var totalScore: Int = 0
    var roundNumber: Int = 0
    var difference: Int = 0
    
    // outlets
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    
    //functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //custom functions
    func startNewRound () {
        roundNumber += 1
        if roundNumber > 1 {
            totalScore += calculateScoreForThisRound()
        }
        currentValue = 50
        slider.value = Float(currentValue)
        targetValue = Int(arc4random_uniform(100)) + 1
        updateLabels()
    }
    func updateLabels () {
        targetLabel.text = "\(targetValue)"
        scoreLabel.text = "\(totalScore)"
        roundLabel.text = "\(roundNumber)"
    }
    func calculateDifference () {
        difference = currentValue - targetValue
        if difference < 0 {
            difference = -difference
        }
    }
    func calculateScoreForThisRound () -> Int {
        if difference == 0 {
            return 200
        }
        else if difference <= 5 {
            return (150 - difference)
        }
        
        else {return 100 - difference
        }
    }
    
    //IBActions
    @IBAction func buttonPressed () {
        
        calculateDifference()
        
        let message = "The target was: \(targetValue)" + "\nThe value of the slider is: \(currentValue)" + "\n You scored: \(100 - difference)"
        
        var title = ""
        
        if difference == 0 {title = "Perfect 💯!"}
        else if difference <= 5 {title = "Nice 👍🏽"}
        else if difference <= 10 {title = "Not Bad 😬"}
        else {title = "Needs Work... 😶"}
        
        let alert = UIAlertController (title: title,
                                       message: message,
                                       preferredStyle: .Alert)
        
        let action = UIAlertAction (title: "Play Again",
                                    style: .Default,
                                    handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
        startNewRound()
        
    }
    @IBAction func sliderMoved(sender: UISlider) {
        
        currentValue = lroundf(sender.value)
        print("the value of the slider is now: \(sender.value)")
    }

}