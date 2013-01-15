//
//  JPModel.m
//  JOSONPractice
//
//  Created by viet on 1/15/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import "JPPerson.h"
#import "JSONKit.h"

@interface JPPerson()
@property (nonatomic, strong) NSMutableData *loadedData;
@property (nonatomic, strong) NSMutableArray *mutablePeopleList;
@end

@implementation JPPerson

- (NSString *)name {
    if (!_name) {
        _name = [[NSString alloc] init];
    }
    return _name;
}

- (NSString *)address {
    if (!_address) {
        _address = [[NSString alloc] init];
    }
    return _address;
}

- (NSDate *)dateOfBirth {
    if (!_dateOfBirth) {
        _dateOfBirth = [[NSDate alloc] init];
    }
    return _dateOfBirth;
}

-(NSMutableData *)loadedData {
    if (!_loadedData) {
        _loadedData = [[NSMutableData alloc] init];
    }
    return _loadedData;
}

- (NSMutableArray *)mutablePeopleList {
    if (!_mutablePeopleList) {
        _mutablePeopleList = [[NSMutableArray alloc] init];
    }
    return _mutablePeopleList;
}

- (NSArray *)peopleList {
    return [self.mutablePeopleList copy];
}


+ (JPPerson *)personWithDictionary:(NSDictionary *)dictionary {
    JPPerson *person = [[JPPerson alloc] init];
    person.name = [dictionary objectForKey:@"name"];
    person.address = [dictionary objectForKey:@"address"];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"ddmmyyyy";
    person.dateOfBirth = [dateFormatter dateFromString:[dictionary objectForKey:@"DoB"]];
    return person;
}

- (void)loadData {
//    [self performSelector:@selector(changeFlagValue) withObject:nil afterDelay:2.0f];
//    NSString *URLString = @"http://dl.dropbox.com/u/75597670/google_news.json";
    NSString *URLString = @"http://dl.dropbox.com/u/77809743/data.json";
    [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:URLString]] delegate:self];

}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.loadedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    id obj = [[self.loadedData copy] objectFromJSONData];
    
    if ([obj isKindOfClass:[NSArray class]]) {
        for (NSDictionary *dict in obj) {
            [self.mutablePeopleList addObject:[JPPerson personWithDictionary:dict]];
        }
        NSLog(@"NSArray");
    } else if ([obj isKindOfClass:[NSDictionary class]]) {
        NSLog(@"NSDictionary");
    }
    NSLog(@"%@", [obj class]);
    
    
    self.dataFinishLoaded = YES;
}

@end
