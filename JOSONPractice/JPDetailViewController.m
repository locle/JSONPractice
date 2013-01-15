//
//  JPViewController.m
//  JOSONPractice
//
//  Created by viet on 1/15/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import "JPDetailViewController.h"

@interface JPDetailViewController ()

@end

@implementation JPDetailViewController

- (JPPerson *)detailData
{
    if (!_detailData)
    {
        _detailData = [[JPPerson alloc] init];
    }
    return _detailData;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.nameDisplay.text = self.detailData.name;
    self.addressDisplay.text = self.detailData.address;
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd mm yyyy";
    self.doBDisplay.text = [dateFormatter stringFromDate:self.detailData.dateOfBirth];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
