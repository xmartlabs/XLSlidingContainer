//
//  MyImageCollectionViewCell.m
//  Slider
//
//  Created by mathias Claassen on 23/3/15.
//  Copyright (c) 2015 Xmartlabs. All rights reserved.
//

#import "MyImageCollectionViewCell.h"

@interface MyImageCollectionViewCell()

@property (nonatomic) UIImageView* imageView;

@end

@implementation MyImageCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        self.imageView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:self.imageView];
    }
    return self;
}


-(void)setImage:(UIImage*) image{
    self.imageView.image = image;
    [self.contentView addSubview:self.imageView];
}

-(UIImageView *)image{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

@end
