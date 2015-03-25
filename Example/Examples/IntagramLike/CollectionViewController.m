//
//  CollectionViewController.m
//  Slider
//
//  Created by mathias Claassen on 20/3/15.
//  Copyright (c) 2015 Xmartlabs. All rights reserved.
//

#import "CollectionViewController.h"
#import "MyImageCollectionViewCell.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[MyImageCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <XLSLiderController>

-(void)minimizedController:(CGFloat)diff{
    [self.view setAlpha:0.3];
    //[self.collectionView setContentInset:UIEdgeInsetsMake(diff, 0, 0, 0)];
    CGFloat currentOffset = self.collectionView.contentOffset.y;
    [self.collectionView setContentOffset:CGPointMake(0, MIN(diff + currentOffset,
                                                             MAX(0, self.collectionView.contentSize.height - CGRectGetHeight(self.view.frame)))) animated:NO];
}

-(void)maximizedController:(CGFloat)diff{
    [self.view setAlpha:1.0];
    //[self.collectionView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    CGFloat currentOffset = self.collectionView.contentOffset.y;
    [self.collectionView setContentOffset:CGPointMake(0, MAX(currentOffset - diff, 0)) animated:NO];
}
-(void)updateFrameForYPct:(CGFloat)y absolute:(CGFloat)diff{
    //CGFloat currentOffset = self.collectionView.contentOffset.y;
    //CGFloat currentInset = self.collectionView.contentInset.top;
    //[self.collectionView setContentInset:UIEdgeInsetsMake(diff + currentInset, 0, 0, 0)];
    //[self.collectionView setContentOffset:CGPointMake(0, (diff/8) + currentOffset) animated:NO];
    }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 24;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    UIImage* image = [UIImage imageNamed:[NSString stringWithFormat:@"flag_%ld", (long)indexPath.item]];
    [cell setImage:image];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}


// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
