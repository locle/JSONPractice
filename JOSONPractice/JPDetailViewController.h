//
//  JPViewController.h
//  JOSONPractice
//
//  Created by viet on 1/15/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JPPerson.h"
#import "JP2359MediaPerson.h"
@interface JPDetailViewController : UITableViewController

@property (nonatomic,strong) JPPerson *person;
@property (nonatomic,strong) JP2359MediaPerson *companyPerson;

@end
