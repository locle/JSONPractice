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
#import "JPDataApiClient.h"
#import "JP2359MediaPerson.h"

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


//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
//    NSData *dataFile = [NSData dataWithContentsOfFile:filePath];
    
//    NSString *dataString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
//    id data = [dataFile objectFromJSONData];

    
        
//    NSLog(@"%@", [data description]);
//    self.person = [[JPPerson alloc] init];
//    [self.person addObserver:self forKeyPath:@"dataFinishLoaded" options:NSKeyValueObservingOptionNew context:nil];
    
//    [self.person loadData];
    
    // Using AFNetworking
//    [[JPDataApiClient sharedInstance] getPath:@"/u/77809743/data.json"
//                                   parameters:nil
//                                      success:^(AFHTTPRequestOperation *operation, id response) {
//                                          id obj = [response objectFromJSONData];
//                                          if ( [obj isKindOfClass:[NSArray class]]){
//                                              self.dataSource = [JPPerson peopleListFromDataArray:obj];
//                                              [self.tableView reloadData];
//                                          }
//                                          NSLog(@"%@",[response class]);
//                                      }
//                                      failure:^(AFHTTPRequestOperation  *operation, NSError *error) {
//                                          NSLog(@"%@",error.description );
//                                      }];
    
    
    [[JPDataApiClient sharedInstance] getPath:@"1/databases/2359media/collections/user?apiKey=50bc7070e4b07d292a90b92b"
                                   parameters:nil
                                      success:^(AFHTTPRequestOperation *operation, id response) {
                                          
                                          id obj = [response objectFromJSONData];
                                          self.dataSource = [JP2359MediaPerson peopleListFromDataArray:obj];
                                          [self.tableView reloadData];
                                          NSLog(@"%@",[obj class]);
                                      }
                                      failure:^(AFHTTPRequestOperation  *operation, NSError *error) {
                                          NSLog(@"%@",error.description );
                                      }];
    
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    self.dataSource = self.person.peopleList;
//    [self.tableView reloadData];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.filteredPeopleArray count];
    } else {
        return [self.dataSource count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RightDetail";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RightDetail"];
    }
    // Configure the cell...
    
    // Check to see whether the normal table or search results table is being displayed and set the Candy object from the appropriate array
    id obj;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        obj = [self.filteredPeopleArray objectAtIndex:indexPath.row];
    } else {
        obj = [self.dataSource objectAtIndex:indexPath.row];
    }
    
    
    if ([obj isKindOfClass:[JP2359MediaPerson class]])
    {
        JP2359MediaPerson *person = obj;
        cell.textLabel.text = person.name;
    }
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    JPDetailViewController *destinationVC = segue.destinationViewController;
    destinationVC.companyPerson = [self.dataSource objectAtIndex:self.tableView.indexPathForSelectedRow.row];
}

#pragma mark - SearchBar
- (NSMutableArray *)filteredPeopleArray {
    if (!_filteredPeopleArray) {
        _filteredPeopleArray = [[NSMutableArray alloc] init];
    }
    return _filteredPeopleArray;
}


//- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
//    if(searchText.length > 0)
//    {
//        [self.filteredPeopleArray removeAllObjects];
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@", searchText];
//        self.filteredPeopleArray = [self.dataSource mutableCopy];
//        [self.filteredPeopleArray filterUsingPredicate:predicate];
//    }
//    [self.tableView reloadData];
//}


- (void)filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope {
    [self.filteredPeopleArray removeAllObjects];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@", searchText];
    self.filteredPeopleArray = [self.dataSource mutableCopy];
    [self.filteredPeopleArray filterUsingPredicate:predicate];
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

@end
