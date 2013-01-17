//
//  JPModel.h
//  JOSONPractice
//
//  Created by viet on 1/15/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JPPerson : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSDate *dateOfBirth;
//@property (nonatomic) BOOL dataFinishLoaded;


//- (void)loadData;
//- (NSArray *)peopleList;
+ (NSArray *)peopleListFromDataArray:(NSArray *)dataArray;
+ (JPPerson *)personWithDictionary:(NSDictionary *)dictionary;

@end
