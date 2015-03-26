//
//  MainTableViewController.m
//  Slider
//
//  Created by mathias Claassen on 20/3/15.
//  Copyright (c) 2015 Xmartlabs. All rights reserved.
//

#import "MainTableViewController.h"
#import "XLSlidingContainerViewController.h"
#import "InstagramViewController.h"
#import "HideUpperDataSource.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController

#define EXAMPLE1 @"Instagramlike"
#define EXAMPLE2 @"Hide upper example"

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //[self initializeRows];
    [self setEdgesForExtendedLayout:UIRectEdgeAll];
    if (self.navigationController)
        [self.navigationController setEdgesForExtendedLayout:UIRectEdgeAll];
}

-(void)initializeRows{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];

    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];

    UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.text = EXAMPLE1;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"maincell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath* indexPath = [self.tableView indexPathForCell:sender];
    UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:indexPath];
        if ([cell.textLabel.text isEqualToString:EXAMPLE2 ]) {
            XLSlidingContainerViewController* sliderVC = segue.destinationViewController;
            sliderVC.dataSource = [[HideUpperDataSource alloc] init];
        }
    //self.navigationController.navigationBar.hidden = YES;
}


@end
