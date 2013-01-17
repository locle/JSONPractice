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
    self.nameDisplay.text = self.companyPerson.name;
    self.usernameDisplay.text = self.companyPerson.username;
    self.roleDisplay.text = self.companyPerson.role;
    self.likeDisplay.text = self.companyPerson.like;
    self.dislikeDisplay.text = self.companyPerson.dislike;


    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd/MM/yy HH:mm";
    self.timestampDisplay.text = [dateFormatter stringFromDate:self.companyPerson.timestamp];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
