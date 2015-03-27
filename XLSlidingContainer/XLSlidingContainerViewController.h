//
//  XLSlidingContainerViewController.h
//  XLForm ( https://github.com/xmartlabs/XLSlidingContainer )
//
//  Copyright (c) 2015 Xmartlabs ( http://xmartlabs.com )
//
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>

// Movement types
typedef NS_ENUM(NSUInteger, XLSlidingContainerMovementType){
    XLSlidingContainerMovementTypePush = 0,
    XLSlidingContainerMovementTypeHideUpperPushLower = 1
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
- (CGFloat)getUpperViewMinFor:(XLSlidingContainerViewController *)sliderViewController;
- (CGFloat)getLowerViewMinFor:(XLSlidingContainerViewController *)sliderViewController;
- (CGFloat) getLowerExtraDraggableArea:(XLSlidingContainerViewController *)sliderViewController;
- (CGFloat) getupperExtraDraggableArea:(XLSlidingContainerViewController *)sliderViewController;
- (XLSlidingContainerMovementType)getMovementTypeFor:(XLSlidingContainerViewController *)sliderViewController;

-(void)slidingContainerDidBeginDrag:(XLSlidingContainerViewController *)sliderViewController;
-(void)slidingContainerDidEndDrag:(XLSlidingContainerViewController *)sliderViewController;
@end


@interface XLSlidingContainerViewController : UIViewController <XLSlidingContainerViewControllerDataSource, XLSlidingContainerViewControllerDelegate>

@property (nonatomic, strong) id <XLSlidingContainerViewControllerDataSource> dataSource;
@property (nonatomic, strong) id <XLSlidingContainerViewControllerDelegate> delegate;

-(void)reloadLowerViewController;
-(void)reloadUpperViewController;
@end

