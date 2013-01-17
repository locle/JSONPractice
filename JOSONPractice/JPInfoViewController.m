//
//  JPInfoViewController.m
//  JOSONPractice
//
//  Created by viet on 1/17/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import "JPInfoViewController.h"

@implementation JPInfoViewController

- (void)viewDidLoad
{
 
    [self.infoWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.2359media.com"]]];

}

@end
