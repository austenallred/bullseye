//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Austen Allred on 12/8/14.
//  Copyright (c) 2014 Austen Allred. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlFile = NSBundle.mainBundle().pathForResource("BullsEye", ofType: "html") {
            let htmlData = NSData(contentsOfFile: htmlFile)
            let baseURL = NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath)
            webView.loadData(htmlData, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
        }
    }
    
    @IBAction func close() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}