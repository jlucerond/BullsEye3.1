//
//  AboutViewController.swift
//  BullsEye3.1
//
//  Created by Joe Lucero on 8/24/16.
//  Copyright © 2016 Joe Lucero. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlFile = NSBundle.mainBundle().pathForResource("BullsEye",
                                                                ofType: "html"){
            
            if let htmlData = NSData(contentsOfFile: htmlFile){
                
                let baseUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().bundlePath)
                
                webView.loadData(htmlData,
                                 MIMEType: "text/html",
                                 textEncodingName: "UTF-8",
                                 baseURL: baseUrl)
            }
        }
    }

    @IBAction func closeButtonPressed () {
        dismissViewControllerAnimated(true,
                                      completion: nil)
    }

}
