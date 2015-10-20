//
//  ImageViewController.swift
//  SplitView2
//
//  Created by Gelei Chen on 15/4/5.
//  Copyright (c) 2015年 Purdue Bang. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController,UIScrollViewDelegate {

    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            println("\(self.title)scrollView didSet")
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1.0
        }
    }
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    var imageURL:NSURL?{
        didSet{
            println("\(self.title)enter imageURL")
            image=nil
        }
    }
    
    private var image:UIImage?{
        get{return imageView.image}
        set{
           imageView.image = newValue
           imageView.sizeToFit()
           scrollView?.contentSize = imageView.frame.size
           activityIndicator?.stopAnimating()
        }
    }
    private var imageView = UIImageView()
    
    private func fetchImamge(){
        println("\(self.title)just fetchImage")
        if let url = imageURL{
            activityIndicator.startAnimating()
            let qos = Int(QOS_CLASS_USER_INITIATED.value)
            dispatch_async(dispatch_get_global_queue(qos, 0)) { () -> Void in
                let imageData = NSData(contentsOfURL: url)
                //println(imageData)
               dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    println("\(self.title)set image")
                    if url == self.imageURL{
                        if imageData != nil{
                            println("\(self.title)before set image")
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
        println("\(self.title)viewDidLoad")
        println(self.title)
        scrollView.addSubview(imageView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        println("\(self.title)viewWillAppear")
        if image==nil{
            fetchImamge()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
