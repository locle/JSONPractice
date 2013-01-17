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
@interface JPDetailViewController : UIViewController

@property (nonatomic,strong) JPPerson *person;
@property (nonatomic,strong) JP2359MediaPerson *companyPerson;

@property (weak, nonatomic) IBOutlet UILabel *nameDisplay;
@property (weak, nonatomic) IBOutlet UILabel *usernameDisplay;
@property (weak, nonatomic) IBOutlet UILabel *timestampDisplay;
@property (weak, nonatomic) IBOutlet UITextView *roleDisplay;
@property (weak, nonatomic) IBOutlet UITextView *likeDisplay;
@property (weak, nonatomic) IBOutlet UITextView *dislikeDisplay;

@end
