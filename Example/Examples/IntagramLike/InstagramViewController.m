//
//  InstagramDataSource.m
//  Slider
//
//  Created by mathias Claassen on 20/3/15.
//  Copyright (c) 2015 Xmartlabs. All rights reserved.
//

#import "InstagramViewController.h"
#import "ScrollViewController.h"
#import "CollectionViewLayout.h"
#import "CollectionViewController.h"

@implementation InstagramViewController

#pragma mark - XLSLiderViewControllerDataSource

- (UIViewController <XLSlidingContainerViewController>*) getUpperControllerFor:(XLSlidingContainerViewController *)sliderViewController{
    return [[ScrollViewController alloc] init];
}
- (UIViewController <XLSlidingContainerViewController>*) getLowerControllerFor:(XLSlidingContainerViewController *)sliderViewController{
    CollectionViewLayout *collectionViewLayout = [[CollectionViewLayout alloc] init];
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

#pragma mark - XLSliderViewControllerDelegate

- (CGFloat)getupperExtraDraggableArea:(XLSlidingContainerViewController *)sliderViewController
{
    return 50.f;
}

- (CGFloat)getLowerExtraDraggableArea:(XLSlidingContainerViewController *)sliderViewController
{
    return 50.f;
}

@end
