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

- (UIViewController <XLSliderController>*) getLowerControllerFor:(XLSliderViewController *)sliderViewController{
    return [[ScrollViewController alloc] init];
}
- (UIViewController <XLSliderController>*) getUpperControllerFor:(XLSliderViewController *)sliderViewController{
    CountryTableViewController* ctvc = [[CountryTableViewController alloc] init];
    return [[SimpleNavigationController alloc] initWithRootViewController:ctvc];
}

-(NSString *)getMovementTypeFor:(XLSliderViewController *)sliderViewController{
    return XLSliderMovementTypeHideUpperPushLower;
}

-(UIView *)getDragView{
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"Exampledragview" owner:nil options:nil];
    return [nibContents lastObject];
}

@end
