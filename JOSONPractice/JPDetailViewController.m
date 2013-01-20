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


    
//    JPPersonDetailCell *cellForHeightCaculating = [self.tableView dequeueReusableCellWithIdentifier:@"JPPersonDetailCell"];
//    NSMutableArray *mutableHeightArray;
//    
//    UIFont *font = cellForHeightCaculating.content.font;
//    double width = cellForHeightCaculating.content.frame.size.width;
    
    UITableViewCell *cellForHeightCaculating = [self.tableView dequeueReusableCellWithIdentifier:@"JPPersonLeftDetailCell"];
    NSMutableArray *mutableHeightArray;
    
    UIFont *font = cellForHeightCaculating.detailTextLabel.font;
    double width = cellForHeightCaculating.detailTextLabel.frame.size.width;
    
  
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

    
    self.title = [NSString stringWithFormat:@"%@ - %@", self.navigationItem.title, self.companyPerson.name];
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
//    static NSString *CellIdentifier = @"JPPersonDetailCell";
//        
//    JPPersonDetailCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    if (!cell) {
//        cell = [[JPPersonDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//    // Configure the cell...
//    
//    // Check to see whether the normal table or search results table is being displayed and set the Candy object from the appropriate array
//    if (indexPath.row == 0) {
//        cell.title.text = @"role";
//        cell.content.text = self.companyPerson.role;
//    } else if (indexPath.row == 1) {
//        cell.title.text = @"like";
//        cell.content.text = self.companyPerson.like;
//    } else if (indexPath.row == 2) {
//        cell.title.text = @"dislike";
//        cell.content.text = self.companyPerson.dislike;
//    }
//    
//    cell.content.numberOfLines = 0;
//    [cell.content sizeToFit];
    
    static NSString *LeftDetailCellIdentifier = @"JPPersonLeftDetailCell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:LeftDetailCellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[JPPersonDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:LeftDetailCellIdentifier];
    }
    // Configure the cell...

    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Name";
            cell.detailTextLabel.text = self.companyPerson.name;
            break;
            
        case 1:
            cell.textLabel.text = @"User Name";
            cell.detailTextLabel.text = self.companyPerson.username;
            break;
            
        case 2:
            cell.textLabel.text = @"Role";
            cell.detailTextLabel.text = self.companyPerson.role;
            break;
            
        case 3:
            cell.textLabel.text = @"Like";
            cell.detailTextLabel.text = self.companyPerson.like;
            break;
            
        case 4:
            cell.textLabel.text = @"Dislike";
            cell.detailTextLabel.text = self.companyPerson.dislike;
            break;
            
        case 5:
            cell.textLabel.text = @"Time Stamp";
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"dd/mm/YYYY"];
            cell.detailTextLabel.text = [dateFormatter stringFromDate:self.companyPerson.timestamp];
            break;
    }
    
    [cell.detailTextLabel setNumberOfLines:0];
    [cell.detailTextLabel setLineBreakMode:NSLineBreakByWordWrapping];

    return cell;
}


@end
