//
//  ScrollViewController.swift
//  XLSliderSwiftExample
//
//  Created by mathias Claassen on 13/8/15.
//  Copyright (c) 2015 Xmartlabs. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController , XLContainedViewVController{
    private var imageView : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(image: UIImage(named: "stonehenge")!)
    }
    
    override func viewWillAppear(animated: Bool) {
        var scrollView : UIScrollView = UIScrollView();
        scrollView.addSubview(imageView);
        scrollView.contentSize = imageView.bounds.size;
        view = scrollView;
    }
    
    func minimizedController(diff: CGFloat){
        view.alpha = 0.3
        return
    }
    
    func maximizedController(diff: CGFloat){
        view.alpha = 1.0
        return
    }

}
