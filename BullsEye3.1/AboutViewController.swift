//
//  AboutViewController.swift
//  BullsEye3.1
//
//  Created by Joe Lucero on 8/24/16.
//  Copyright © 2016 Joe Lucero. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeButtonPressed () {
        dismissViewControllerAnimated(true,
                                      completion: nil)
    }

}
