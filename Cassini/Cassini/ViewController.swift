//
//  ViewController.swift
//  Cassini
//
//  Created by Gelei Chen on 15/3/25.
//  Copyright (c) 2015年 Purdue Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let ivc = segue.destinationViewController as? ImageViewController{
            if let identifier = segue.identifier {
                switch identifier {
                case "earth" :
                    ivc.imageURL = DemoURL.NASA.Earth
                    ivc.title = "Earth"
                case "saturn" :
                    ivc.imageURL = DemoURL.NASA.Saturn
                    ivc.title = "Saturn"
                case "cassini" :
                    ivc.imageURL = DemoURL.NASA.Cassini
                    ivc.title = "Cassini"
                default :
                    break
                }
            }
        }
    }

}

