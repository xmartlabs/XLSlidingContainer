//
//  CollectionViewController.swift
//  XLSliderSwiftExample
//
//  Created by Mathias Claassen on 13/8/15.
//  Copyright (c) 2015 Xmartlabs. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController, XLContainedViewVController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.registerClass(MyImageCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: <XLSLiderController>
    
    func minimizedController(diff: CGFloat){
        view.alpha = 0.3
        var currentOffset : CGFloat = collectionView!.contentOffset.y
        collectionView!.setContentOffset(CGPoint(x: 0, y: min(diff + currentOffset, max(0, collectionView!.contentSize.height - view.frame.size.height))), animated: false)
    }
    
    func maximizedController(diff: CGFloat){
        view.alpha = 1.0
        var currentOffset : CGFloat = collectionView!.contentOffset.y
        collectionView!.setContentOffset(CGPoint(x: 0, y: max(0, currentOffset - diff)), animated: false)
    }

    
    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MyImageCollectionViewCell
        
        var image : UIImage = UIImage(named: "flag_\(indexPath.item)")!
        cell.setImage(image)
    
        return cell
    }
}
