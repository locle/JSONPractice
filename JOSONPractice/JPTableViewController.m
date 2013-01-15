//
//  JPTableViewController.m
//  JOSONPractice
//
//  Created by viet on 1/15/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import "JPTableViewController.h"
#import "JSONKit.h"
#import "JPDetailViewController.h"
#import "JPPerson.h"


@interface JPTableViewController ()

@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,strong) JPPerson *person;

@end

@implementation JPTableViewController

//getter
- (NSArray *)dataSource
{
    if (!_dataSource)
    {
        _dataSource = [[NSArray alloc] init];
    }
    return _dataSource;
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.delegate = self;
    
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
//    NSData *dataFile = [NSData dataWithContentsOfFile:filePath];
    
//    NSString *dataString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
//    id data = [dataFile objectFromJSONData];

    
        
//    NSLog(@"%@", [data description]);
    self.person = [[JPPerson alloc] init];
    [self.person addObserver:self forKeyPath:@"dataFinishLoaded" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.person loadData];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    self.dataSource = self.person.peopleList;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RightDetail";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RightDetail"];
    }
    // Configure the cell...
    id obj = [self.dataSource objectAtIndex:indexPath.row];
    if ([obj isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *temp = obj;
        cell.textLabel.text = [temp objectForKey:@"name"];
    } else {
        JPPerson *person = obj;
        cell.textLabel.text = person.name;
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    JPDetailViewController *destinationVC = segue.destinationViewController;
    destinationVC.detailData = [self.dataSource objectAtIndex:self.tableView.indexPathForSelectedRow.row];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
//     JPDetailViewController *detailViewController = [[JPDetailViewController alloc] init];
//     // ...
//     // Pass the selected object to the new view controller.
//    detailViewController.detailData = [self.dataSource objectAtIndex:indexPath.row];
//     [self.navigationController pushViewController:detailViewController animated:YES];
    
}

@end
