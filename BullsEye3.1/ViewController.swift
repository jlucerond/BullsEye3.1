//
//  ViewController.swift
//  BullsEye3.1
//
//  Created by Joe Lucero on 8/18/16.
//  Copyright © 2016 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // variables
    var currentValue: Int = 0
    var targetValue: Int = 0
    
    // outlets
    @IBOutlet weak var slider: UISlider!
    
    //functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentValue = lroundf(slider.value)
        targetValue = Int(arc4random_uniform(100)) + 1
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //IBActions
    @IBAction func buttonPressed () {
        
        let message = "The target was: \(targetValue)" + "\nThe value of the slider is: \(currentValue)"
        
        let alert = UIAlertController (title: "Hello, World",
                                       message: message,
                                       preferredStyle: .Alert)
        
        let action = UIAlertAction (title: "click here",
                                    style: .Default,
                                    handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    @IBAction func sliderMoved(sender: UISlider) {
        
        currentValue = lroundf(sender.value)
        print("the value of the slider is now: \(sender.value)")
    }

}