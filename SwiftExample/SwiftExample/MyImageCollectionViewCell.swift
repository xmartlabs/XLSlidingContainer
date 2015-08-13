//
//  MyImageCollectionViewCell.swift
//  XLSliderSwiftExample
//
//  Created by mathias Claassen on 13/8/15.
//  Copyright (c) 2015 Xmartlabs. All rights reserved.
//

import UIKit

class MyImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //initialize();
    }
    
    func initialize(){
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        imageView!.backgroundColor = UIColor.whiteColor()
        contentView.addSubview(imageView!)
    }
    
    internal func setImage(image: UIImage){
        imageView.image = image
    }
    
}
