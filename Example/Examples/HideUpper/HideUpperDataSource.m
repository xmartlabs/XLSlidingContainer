//
//  HideUpperDataSource.m
//  Slider
//
//  Created by mathias Claassen on 20/3/15.
//  Copyright (c) 2015 Xmartlabs. All rights reserved.
//

#import "HideUpperDataSource.h"
#import "ScrollViewController.h"
#import "CountryTableViewController.h"
#import "SimpleNavigationController.h"

@implementation HideUpperDataSource

- (UIViewController <XLSlidingContainerViewController>*) getLowerControllerFor:(XLSlidingContainerViewController *)sliderViewController{
    return [[ScrollViewController alloc] init];
}
- (UIViewController <XLSlidingContainerViewController>*) getUpperControllerFor:(XLSlidingContainerViewController *)sliderViewController{
    CountryTableViewController* ctvc = [[CountryTableViewController alloc] init];
    return [[SimpleNavigationController alloc] initWithRootViewController:ctvc];
}

-(XLSlidingContainerMovementType)getMovementTypeFor:(XLSlidingContainerViewController *)sliderViewController
{
    return XLSlidingContainerMovementTypeHideUpperPushLower;
}

-(UIView *)getDragView{
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"Exampledragview" owner:nil options:nil];
    return [nibContents lastObject];
}

@end
