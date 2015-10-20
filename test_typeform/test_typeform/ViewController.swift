//
//  ViewController.swift
//  test_typeform
//
//  Created by Gelei Chen on 15/4/18.
//  Copyright (c) 2015年 Purdue Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let one = NSData(contentsOfURL: NSURL(string: "https://api.typeform.com/v0/form/FHpkO3?key=d78d2a7efdac67f00f41006fd28e03b044c75545&completed=true")!)
        let result = NSJSONSerialization.JSONObjectWithData(one!, options: NSJSONReadingOptions.AllowFragments, error: nil) as! NSDictionary
        for entry in (result["responses"] as! NSArray){
            for entryDict in (entry["answers"] as! NSDictionary){
                println(entryDict)
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

