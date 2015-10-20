//
//  BazierPathsView.swift
//  Dropit
//
//  Created by Gelei Chen on 15/3/29.
//  Copyright (c) 2015年 Purdue Bang. All rights reserved.
//

import UIKit

class BezierPathsView: UIView {

    private var bazierPaths = [String:UIBezierPath]()
    func setPath(path:UIBezierPath?,named name : String){
        bazierPaths[name] = path
        setNeedsDisplay()
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        for(_,path) in bazierPaths{
            path.stroke()
        }
    }
    

}
