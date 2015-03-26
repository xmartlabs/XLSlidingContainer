//
//  ViewController.h
//  Slider
//
//  Created by mathias Claassen on 17/3/15.
//  Copyright (c) 2015 Xmartlabs. All rights reserved.
//

#import <UIKit/UIKit.h>

// Movement types
typedef NS_ENUM(NSUInteger, XLSlidingContainerMovementType){
    XLSlidingContainerMovementTypePush = 0,
    XLSlidingContainerMovementTypeHideUpperPushLower
};


@class XLSlidingContainerViewController;

@protocol XLSlidingContainerViewController
// to be implemented by embedded controllers
@optional
- (void) minimizedController:(CGFloat) diff;
- (void) maximizedController:(CGFloat) diff;
- (void) updateFrameForYPct:(CGFloat)y absolute:(CGFloat)diff;

@end


@protocol XLSlidingContainerViewControllerDataSource <NSObject>
// datasource
@required
- (UIViewController <XLSlidingContainerViewController>*) getLowerControllerFor:(XLSlidingContainerViewController *)sliderViewController;
- (UIViewController <XLSlidingContainerViewController>*) getUpperControllerFor:(XLSlidingContainerViewController *)sliderViewController;

@optional
- (UIView*) getDragView;
@end


@protocol XLSlidingContainerViewControllerDelegate <NSObject>
// delegate
@optional
- (CGFloat) getUpperViewMinFor:(XLSlidingContainerViewController *)sliderViewController;
- (CGFloat) getLowerViewMinFor:(XLSlidingContainerViewController *)sliderViewController;
- (XLSlidingContainerMovementType) getMovementTypeFor:(XLSlidingContainerViewController *)sliderViewController;
@end


@interface XLSlidingContainerViewController : UIViewController <XLSlidingContainerViewControllerDataSource, XLSlidingContainerViewControllerDelegate>

@property (nonatomic, strong) id <XLSlidingContainerViewControllerDataSource> dataSource;
@property (nonatomic, strong) id <XLSlidingContainerViewControllerDelegate> delegate;

-(void)reloadLowerViewController;
-(void)reloadUpperViewController;
@end

