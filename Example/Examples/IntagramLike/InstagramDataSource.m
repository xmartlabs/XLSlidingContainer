//
//  InstagramDataSource.m
//  Slider
//
//  Created by mathias Claassen on 20/3/15.
//  Copyright (c) 2015 Xmartlabs. All rights reserved.
//

#import "InstagramDataSource.h"
#import "ScrollViewController.h"
#import "CollectionViewLayout.h"
#import "CollectionViewController.h"

@implementation InstagramDataSource

- (UIViewController <XLSliderController>*) getUpperControllerFor:(XLSliderViewController *)sliderViewController{
    return [[ScrollViewController alloc] init];
}
- (UIViewController <XLSliderController>*) getLowerControllerFor:(XLSliderViewController *)sliderViewController{
    CollectionViewLayout *collectionViewLayout = [[CollectionViewLayout alloc] init];
    CollectionViewController* controller = [[CollectionViewController alloc] initWithCollectionViewLayout:collectionViewLayout];
    return controller;
}

-(XLSliderContainerMovementType *)getMovementTypeFor:(XLSliderViewController *)sliderViewController{
    return XLSliderContainerMovementTypePush;
}

-(UIView *)getDragView{
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"Exampledragview2" owner:nil options:nil];
    return [nibContents lastObject];
}

@end
