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
//    self.person = [[JPPerson alloc] init];
//    [self.person addObserver:self forKeyPath:@"dataFinishLoaded" options:NSKeyValueObservingOptionNew context:nil];
    
//    [self.person loadData];
    [[JPDataApiClient sharedInstance] getPath:@"/u/77809743/data.json"
                                   parameters:nil
                                      success:^(AFHTTPRequestOperation *operation, id response) {
                                          id obj = [response objectFromJSONData];
                                          if ( [obj isKindOfClass:[NSArray class]]){
                                              self.dataSource = [JPPerson peopleListFromDataArray:obj];
                                              [self.tableView reloadData];
                                          }
                                          NSLog(@"%@",[response class]);
                                      }
                                      failure:^(AFHTTPRequestOperation  *operation, NSError *error) {
                                          NSLog(@"%@",error.description );
                                      }];
    
//    id obj = [[self.loadedData copy] objectFromJSONData];
//    
//    if ([obj isKindOfClass:[NSArray class]]) {
//        for (NSDictionary *dict in obj) {
//            [self.mutablePeopleList addObject:[JPPerson personWithDictionary:dict]];
//        }
//        NSLog(@"NSArray");
//    } else if ([obj isKindOfClass:[NSDictionary class]]) {
//        NSLog(@"NSDictionary");
//    }
//    NSLog(@"%@", [obj class]);
//    
//    
//    self.dataFinishLoaded = YES;

    
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


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    JPDetailViewController *destinationVC = segue.destinationViewController;
    destinationVC.person = [self.dataSource objectAtIndex:self.tableView.indexPathForSelectedRow.row];
}

#pragma mark - Table view delegate


@end
