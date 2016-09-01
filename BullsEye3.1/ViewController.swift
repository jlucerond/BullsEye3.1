//
//  ViewController.swift
//  BullsEye3.1
//
//  Created by Joe Lucero on 8/18/16.
//  Copyright © 2016 Joe Lucero. All rights reserved.
//

// digital pages 125-139

import UIKit
import QuartzCore

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
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") {
            let trackLeftResizable = trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
        }
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
        
        var title = ""
        
        if difference == 0 {title = "Perfect 💯!"}
        else if difference <= 5 {title = "Nice 👍🏽"}
        else if difference <= 10 {title = "Not Bad 😬"}
        else {title = "Needs Work... 😶"}
        
        let message = "The target was: \(targetValue)" + "\nThe value of the slider is: \(currentValue)" + "\n You scored: \(calculateScoreForThisRound())"

        
        let alert = UIAlertController (title: title,
                                       message: message,
                                       preferredStyle: .Alert)
        
        let action = UIAlertAction (title: "Play Again",
                                    style: .Default,
                                    handler: { action in
                                        self.startNewRound()
                                    })
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    @IBAction func sliderMoved(sender: UISlider) {
        
        currentValue = lroundf(sender.value)
        print("the value of the slider is now: \(sender.value)")
    }
    @IBAction func startOver () {
        totalScore = 0
        roundNumber = 0
        difference = 0
        startNewRound()
        
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        view.layer.addAnimation(transition, forKey: nil)
    }
    
}