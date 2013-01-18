//
//  JPViewController.m
//  JOSONPractice
//
//  Created by viet on 1/15/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import "JPDetailViewController.h"
#import "JPPersonDetailCell.h"

#define CELL_PADDING 20
#define MAX_HEIGHT 1000

@interface JPDetailViewController ()
@property (nonatomic, strong) NSMutableArray *cellHeightArray;
@end

@implementation JPDetailViewController

- (JPPerson *)person
{
    if (!_person)
    {
        _person = [[JPPerson alloc] init];
    }
    return _person;
}

- (NSMutableArray *)cellHeightArray
{
    if (!_cellHeightArray)
    {
        _cellHeightArray = [[NSMutableArray alloc] init];
    }
    return _cellHeightArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.


    JPPersonDetailCell *cellForHeightCaculating = [self.tableView dequeueReusableCellWithIdentifier:@"JPPersonDetailCell"];
    NSMutableArray *mutableHeightArray;
    
    UIFont *font = cellForHeightCaculating.content.font;
    double width = cellForHeightCaculating.content.frame.size.width;
    
    CGSize labelFullSize = [self.companyPerson.role sizeWithFont:font constrainedToSize:CGSizeMake(width, MAX_HEIGHT)];
    mutableHeightArray = [NSMutableArray arrayWithObject:[NSNumber numberWithDouble:labelFullSize.height]];
    
    DLog(@"w = %g, h = %g", labelFullSize.width, labelFullSize.height);
    
    labelFullSize = [self.companyPerson.like sizeWithFont:font constrainedToSize:CGSizeMake(width, MAX_HEIGHT)];
    DLog(@"w = %g, h = %g", labelFullSize.width, labelFullSize.height);
    [mutableHeightArray addObject:[NSNumber numberWithDouble:labelFullSize.height]];
    
    labelFullSize = [self.companyPerson.dislike sizeWithFont:font constrainedToSize:CGSizeMake(width, MAX_HEIGHT)];
    DLog(@"w = %g, h = %g", labelFullSize.width, labelFullSize.height);
    
    [mutableHeightArray addObject:[NSNumber numberWithDouble:labelFullSize.height]];
    
    self.cellHeightArray = [mutableHeightArray copy];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableViewController
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[self.cellHeightArray objectAtIndex:indexPath.row] doubleValue] + CELL_PADDING;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"JPPersonDetailCell";
    JPPersonDetailCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[JPPersonDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"JPPersonDetailCell"];
    }
    // Configure the cell...
    
    // Check to see whether the normal table or search results table is being displayed and set the Candy object from the appropriate array
    if (indexPath.row == 0) {
        cell.title.text = @"role";
        cell.content.text = self.companyPerson.role;
    } else if (indexPath.row == 1) {
        cell.title.text = @"like";
        cell.content.text = self.companyPerson.like;
    } else if (indexPath.row == 2) {
        cell.title.text = @"dislike";
        cell.content.text = self.companyPerson.dislike;
    }
    
    cell.content.numberOfLines = 0;
    [cell.content sizeToFit];
    
    
    
    
    return cell;
}


@end
