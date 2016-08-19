//
//  ViewController.swift
//  BullsEye3.1
//
//  Created by Joe Lucero on 8/18/16.
//  Copyright © 2016 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed () {
        
        let alert = UIAlertController (title: "top line",
                                       message: "you got: \(currentValue)",
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