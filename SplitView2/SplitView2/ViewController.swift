//
//  ViewController.swift
//  SplitView2
//
//  Created by Gelei Chen on 15/4/5.
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
        let dvc = segue.destinationViewController as? ImageViewController
        let identifier = segue.identifier
        switch identifier!{
            case "toEarth":
                dvc?.title = "Earth"
                dvc?.imageURL = DemoURL.NASA.Earhath
            case "toSaturn":
                dvc?.title = "Saturn"
                dvc?.imageURL = DemoURL.NASA.Saturn
            case "toCassini":
                dvc?.title = "Cassini"
                dvc?.imageURL = DemoURL.NASA.Cassini
        default:
            break
        }
    }

}

