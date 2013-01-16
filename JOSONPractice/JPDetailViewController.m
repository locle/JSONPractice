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

- (JPPerson *)person
{
    if (!_person)
    {
        _person = [[JPPerson alloc] init];
    }
    return _person;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.nameDisplay.text = self.person.name;
    self.addressDisplay.text = self.person.address;
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd mm yyyy";
    self.doBDisplay.text = [dateFormatter stringFromDate:self.person.dateOfBirth];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
