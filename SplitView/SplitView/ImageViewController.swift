//
//  ImageViewController.swift
//  SplitView
//
//  Created by Gelei Chen on 15/4/3.
//  Copyright (c) 2015年 Purdue Bang. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController,UIScrollViewDelegate {


    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1.0
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    private var imageView = UIImageView()
    
    private var image:UIImage?{
        get{return imageView.image}
        set{
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
    }
    
    var imageURL : NSURL?{
        didSet{
            image = nil
            /*
            if view.window != nil{
                println("before calling fetchImage")
                fetchImage()
            }*/
        }
    }
    
    private func fetchImage(){
        if let url = imageURL{
            spinner.startAnimating()
            let qos = Int(QOS_CLASS_USER_INITIATED.value)
            dispatch_async(dispatch_get_global_queue(qos, 0)) { () -> Void in
                let imageData = NSData(contentsOfURL: url)
                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    if url == self.imageURL{
                        if imageData != nil{
                            self.image = UIImage(data: imageData!)
                        } else {
                            self.image = nil
                        }
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("viewDidLoad")
        scrollView.addSubview(imageView)
    }
    
    override func viewWillAppear(animated: Bool) {
        println("viewWillAppear")
        if image == nil{
            println("fromviewWillAppear")
            fetchImage()
        }
    }

}
