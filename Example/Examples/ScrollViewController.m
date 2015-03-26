//
//  ScrollViewController.m
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
