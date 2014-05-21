//
//  TTGetJson.m
//  TendigiTwitterFeed
//
//  Created by Skye Freeman on 5/18/14.
//  Copyright (c) 2014 SkyeFreeman. All rights reserved.
//

#import "TTGetJson.h"
#import "STTwitterAPI.h"

NSString *const TWITTER_USER = @"TENDIGI";
NSString *const KEY = @"IksqzfZL55wmfhw2o1wPydklP";
NSString *const SECRET = @"yzlzdPLiRFWtea7R2voHhZjVEGDgNtL4hBNx9Hy6BIC8Wkq61h";

@implementation TTGetJson

-(id)init {
	
	return [self initWithJson:TWITTER_USER];
}

-(id)initWithJson:(NSString*)screenName {
	
	self = [super init];
	
	if (self) {
		
		STTwitterAPI *twitter = [STTwitterAPI twitterAPIAppOnlyWithConsumerKey:KEY
																consumerSecret:SECRET];
		
		[twitter verifyCredentialsWithSuccessBlock:^(NSString *bearerToken) {
			
			NSLog(@"Access granted with %@", bearerToken);
			
			[twitter getUserTimelineWithScreenName:screenName successBlock:^(NSArray *statuses) {
				
				self.fetchedData = [[NSArray alloc] initWithArray:statuses];
				
				
//				NSLog(@"statuses: %@", self.fetchedData);
				if (self.fetchedData) {
					[[NSNotificationCenter defaultCenter] postNotificationName:@"initWithJSONFinishedLoading"	object:nil];
				}
				
			} errorBlock:^(NSError *error) {
				
				NSLog(@"error: %@", error);
			}];
			
			
		} errorBlock:^(NSError *error) {
			NSLog(@"error %@", error);
		}];

		
	}
		return self;
}

@end
