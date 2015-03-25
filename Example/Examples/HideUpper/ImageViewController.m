//
//  ImageViewController.m
//  FlickrPhotos
//
//  Created by mathias Claassen on 10/3/15.
//  Copyright (c) 2015 Xmartlabs. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
@property (nonatomic, strong) UIImageView* imageView;
@property (nonatomic, strong) UIButton* button;
@end

@implementation ImageViewController

-(UIImageView*)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}
-(UIImage*)image{
    return self.imageView.image;
}

-(void)setImage:(UIImage *)image{
    self.imageView.image = image;
    [self.imageView sizeToFit];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.imageView];
    
    [self.view setBackgroundColor:[UIColor grayColor]];
    [self setEdgesForExtendedLayout:UIRectEdgeAll];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.imageView.center = self.view.center;
    self.navigationController.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationController.navigationBar.hidden = NO;
}

-(void)dismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
