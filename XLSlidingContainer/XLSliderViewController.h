//
//  ViewController.h
//  Slider
//
//  Created by mathias Claassen on 17/3/15.
//  Copyright (c) 2015 Xmartlabs. All rights reserved.
//

#import <UIKit/UIKit.h>

// Movement types
typedef NS_ENUM(NSUInteger, XLSliderContainerMovementType){
    XLSliderContainerMovementTypePush = 0,
    XLSliderContainerMovementTypeHideUpperPushLower
};


@class XLSliderViewController;

@protocol XLSliderController
// to be implemented by embedded controllers
@optional
- (void) minimizedController:(CGFloat) diff;
- (void) maximizedController:(CGFloat) diff;
- (void) updateFrameForYPct:(CGFloat)y absolute:(CGFloat)diff;

@end


@protocol XLSliderViewControllerDataSource <NSObject>
// datasource
@required
- (UIViewController <XLSliderController>*) getLowerControllerFor:(XLSliderViewController *)sliderViewController;
- (UIViewController <XLSliderController>*) getUpperControllerFor:(XLSliderViewController *)sliderViewController;

@optional
- (UIView*) getDragView;
@end


@protocol XLSliderViewControllerDelegate <NSObject>
// delegate
@optional
- (CGFloat) getUpperViewMin;
- (CGFloat) getLowerViewMin;
- (XLSliderContainerMovementType) getMovementTypeFor:(XLSliderViewController *)sliderViewController;
@end


@interface XLSliderViewController : UIViewController <XLSliderViewControllerDataSource, XLSliderViewControllerDelegate>

@property (nonatomic, strong) id <XLSliderViewControllerDataSource> dataSource;
@property (nonatomic, strong) id <XLSliderViewControllerDelegate> delegate;

-(void)reloadLowerViewController;
-(void)reloadUpperViewController;
@end

