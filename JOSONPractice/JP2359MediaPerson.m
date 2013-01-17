//
//  JP2359MediaPerson.m
//  JOSONPractice
//
//  Created by viet on 1/17/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import "JP2359MediaPerson.h"

@implementation JP2359MediaPerson

- (NSDate *)timestamp {
    if (!_timestamp) {
        _timestamp = [[NSDate alloc] init];
    }
    return _timestamp;
}


+ (NSArray *)peopleListFromDataArray:(NSArray *)dataArray
{
    NSMutableArray *mutablePeopleList = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in dataArray) {
        [mutablePeopleList addObject:[JP2359MediaPerson personWithDictionary:dict]];
    }
    return [mutablePeopleList copy];
    
}

+ (JP2359MediaPerson *)personWithDictionary:(NSDictionary *)dictionary {
    JP2359MediaPerson *person = [[JP2359MediaPerson alloc] init];
    
    person.username = [dictionary objectForKey:@"userName"];
    person.name = [dictionary objectForKey:@"name"];
    person.role = [dictionary objectForKey:@"role"];
    person.like = [dictionary objectForKey:@"like"];
    person.dislike = [dictionary objectForKey:@"dislike"];
    


    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"M/d/yy HH:mm";
    person.timestamp = [dateFormatter dateFromString:[dictionary objectForKey:@"timeStamp"]];
    return person;
}


@end
