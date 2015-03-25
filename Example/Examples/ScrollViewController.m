//
//  DownViewController.m
//  Slider
//
//  Created by mathias Claassen on 17/3/15.
//  Copyright (c) 2015 Xmartlabs. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@property (nonatomic) UIImageView* image;

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView* scrollView = [[UIScrollView alloc] init];
    [scrollView addSubview:self.image];
    scrollView.contentSize = self.image.bounds.size;
    self.view = scrollView;
    // Do any additional setup after loading the view.
}

-(UIImageView *)image{
    if(!_image)
        _image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stonehenge" ]];
    
    return _image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)minimizedController:(CGFloat) diff{
    [self.view setAlpha:0.3];
    return;
}

-(void)maximizedController:(CGFloat) diff{
    [self.view setAlpha:1.0];
    return;
}

-(void)updateFrameForYPct:(CGFloat)y{
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
