//
//  JPDataApiClient.m
//  JOSONPractice
//
//  Created by viet on 1/17/13.
//  Copyright (c) 2013 2359media. All rights reserved.
//

#import "JPDataApiClient.h"

@implementation JPDataApiClient

+(id)sharedInstance
{
//    NSString *baseURL = @"http://dl.dropbox.com";
    NSString *baseURL = @"https://api.mongolab.com/api/";

    static JPDataApiClient *__sharedInstance;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        __sharedInstance = [[JPDataApiClient alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
    }   );
    return __sharedInstance;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        //custom settings
//        [self setDefaultHeader:@"x-api-token" value:BeersAPIToken];
//        
//        
//        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    }
    
    return self;
}

@end
