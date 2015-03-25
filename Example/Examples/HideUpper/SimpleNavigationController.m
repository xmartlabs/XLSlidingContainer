//
//  LowerNavigationController.m
//  Slider
//
//  Created by mathias Claassen on 20/3/15.
//  Copyright (c) 2015 Xmartlabs. All rights reserved.
//

#import "SimpleNavigationController.h"

@interface SimpleNavigationController ()

@end

@implementation SimpleNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setEdgesForExtendedLayout:UIRectEdgeAll];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) minimizedController:(CGFloat) diff{
    UIViewController<XLSliderController>* root = [[self viewControllers] firstObject];
    [root minimizedController:(diff + CGRectGetHeight(self.navigationController.navigationBar.frame))];
}
- (void) maximizedController:(CGFloat) diff{
    UIViewController<XLSliderController>* root = [[self viewControllers] firstObject];
    [root maximizedController:(diff + CGRectGetHeight(self.navigationController.navigationBar.frame))];
}
- (void) updateFrameForYPct:(CGFloat)y{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
