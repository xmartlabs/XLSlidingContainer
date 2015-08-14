//
//  ImageControllerDataSource.swift
//  XLSliderSwiftExample
//
//  Created by mathias Claassen on 13/8/15.
//  Copyright (c) 2015 Xmartlabs. All rights reserved.
//

import UIKit

class MainController: XLSlidingContainerViewController , XLSlidingContainerViewControllerDataSource, XLSlidingContainerViewControllerDelegate
{
    
    override func getUpperControllerFor(XLSlidingContainerViewController) -> UIViewController {
        var viewController : ScrollViewController = ScrollViewController()
        return viewController
    }
    
    override func getLowerControllerFor(XLSlidingContainerViewController) -> UIViewController {
        var collectionViewLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: 90, height: 60)
        collectionViewLayout.scrollDirection = UICollectionViewScrollDirection.Vertical
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
        collectionViewLayout.minimumLineSpacing = 15
        var controller : CollectionViewController = CollectionViewController(collectionViewLayout:collectionViewLayout)
        return controller
    }
    
    override func getMovementTypeFor(sliderViewController: XLSlidingContainerViewController!) -> XLSlidingContainerMovementType {
        return XLSlidingContainerMovementType.HideUpperPushLower
    }
    
    override func getDragView() -> UIView! {
        return NSBundle.mainBundle().loadNibNamed("DragView2", owner: self, options: nil)[0] as! UIView
    }
    
    override func getupperExtraDraggableArea(sliderViewController: XLSlidingContainerViewController!) -> CGFloat {
        return 15.0
    }
    
    override func getLowerExtraDraggableArea(sliderViewController: XLSlidingContainerViewController!) -> CGFloat {
        return 15.0
    }
    
}
