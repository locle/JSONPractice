//
//  JPViewController.h
//  JOSONPractice
//
//  Created by viet on 1/15/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JPPerson.h"
@interface JPDetailViewController : UIViewController

@property (nonatomic,strong) JPPerson *person;

@property (weak, nonatomic) IBOutlet UILabel *nameDisplay;
@property (weak, nonatomic) IBOutlet UILabel *addressDisplay;
@property (weak, nonatomic) IBOutlet UILabel *doBDisplay;

@end
