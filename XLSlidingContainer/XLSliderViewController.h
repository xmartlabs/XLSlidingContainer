//
//  ViewController.h
//  Slider
//
//  Created by mathias Claassen on 17/3/15.
//  Copyright (c) 2015 Xmartlabs. All rights reserved.
//

#import <UIKit/UIKit.h>

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
- (NSString*) getMovementTypeFor:(XLSliderViewController *)sliderViewController;

@optional
- (UIView*) getDragView;
@end


@protocol XLSliderViewControllerDelegate <NSObject>
// delegate
@optional
- (CGFloat) getUpperViewMin;
- (CGFloat) getLowerViewMin;
@end


@interface XLSliderViewController : UIViewController <XLSliderViewControllerDataSource, XLSliderViewControllerDelegate>

@property (nonatomic) NSString* movementType;

@property (nonatomic, strong) id <XLSliderViewControllerDataSource> dataSource;
@property (nonatomic, strong) id <XLSliderViewControllerDelegate> delegate;

-(void)reloadLowerViewController;
-(void)reloadUpperViewController;
@end


//     Movement types
extern NSString *const XLSliderMovementTypePush;
extern NSString *const XLSliderMovementTypeHideUpperPushLower;