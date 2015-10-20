//
//  ViewController.swift
//  SplitView
//
//  Created by Gelei Chen on 15/4/3.
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
        //println((sender as UIButton).titleLabel?.text)
        if let dvc = segue.destinationViewController as? ImageViewController{
            if let identifier = segue.identifier {
                switch identifier {
                    case "toEarth":
                        dvc.title = "Earth"
                        dvc.imageURL = DemoURL.NASA.Earth
                    case "toCassini":
                        dvc.title = "Cassini"
                        dvc.imageURL = DemoURL.NASA.Cassini
                    case "toSaturn":
                        dvc.title = "Saturn"
                        dvc.imageURL = DemoURL.NASA.Saturn
                default:break
                }
            }
        }
    }

}

