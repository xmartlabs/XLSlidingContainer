//
//  ImageViewController.m
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
