//
//  JP2359MediaPerson.h
//  JOSONPractice
//
//  Created by viet on 1/17/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JP2359MediaPerson : NSObject
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *role;
@property (nonatomic, strong) NSString *like;
@property (nonatomic, strong) NSString *dislike;
@property (nonatomic, strong) NSDate *timestamp;

+ (NSArray *)peopleListFromDataArray:(NSArray *)dataArray;
+ (JP2359MediaPerson *)personWithDictionary:(NSDictionary *)dictionary;
@end
