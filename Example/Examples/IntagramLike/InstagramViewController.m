//
//  InstagramDataSource.m
//  Slider
//
//  Created by mathias Claassen on 20/3/15.
//  Copyright (c) 2015 Xmartlabs. All rights reserved.
//

#import "InstagramViewController.h"
#import "ScrollViewController.h"
#import "CollectionViewController.h"

@implementation InstagramViewController

#pragma mark - XLSLiderViewControllerDataSource

- (UIViewController <XLSlidingContainerViewController>*) getUpperControllerFor:(XLSlidingContainerViewController *)sliderViewController{
    return [[ScrollViewController alloc] init];
}
- (UIViewController <XLSlidingContainerViewController>*) getLowerControllerFor:(XLSlidingContainerViewController *)sliderViewController{
    UICollectionViewFlowLayout* collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    collectionViewLayout.itemSize = CGSizeMake(90, 60);
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(15, 10.0, 15, 10.0);
    collectionViewLayout.minimumLineSpacing = 15.0;
    
    CollectionViewController* controller = [[CollectionViewController alloc] initWithCollectionViewLayout:collectionViewLayout];
    return controller;
}

-(XLSlidingContainerMovementType)getMovementTypeFor:(XLSlidingContainerViewController *)sliderViewController{
    return XLSlidingContainerMovementTypePush;
}

-(UIView *)getDragView{
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"Exampledragview2" owner:nil options:nil];
    return [nibContents lastObject];
}

@end
