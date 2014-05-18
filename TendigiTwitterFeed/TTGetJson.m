//
//  TTGetJson.m
//  TendigiTwitterFeed
//
//  Created by Skye Freeman on 5/18/14.
//  Copyright (c) 2014 SkyeFreeman. All rights reserved.
//

#import "TTGetJson.h"
#import "AFNetworking.h"

NSString *const URL_STRING = @"https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=TENDIGI&count=1";

@implementation TTGetJson

-(id)init {
	
	return [self initWithJson:URL_STRING];
}

-(id)initWithJson:(NSString*)jsonURL {
	
	self = [super init];
	
	if (self) {
		NSURL *url = [[NSURL alloc] initWithString:jsonURL];
		NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
		AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]
											 initWithRequest:request];
		operation.responseSerializer = [AFJSONResponseSerializer serializer];
		[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id JSON) {
			
			NSMutableArray *tempArray = [[NSMutableArray alloc] init];
			for (NSDictionary *data in JSON) {
				
				[tempArray addObject:data];
			}
			self.fetchedData = [[NSArray alloc] initWithArray:tempArray];

			
			[[NSNotificationCenter defaultCenter] postNotificationName:@"initWithJSONFinishedLoading"
																object:nil];
			
		} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
			NSLog(@"NSError: %@",error.localizedDescription);
		}];
		[operation start];
	}
	
	return self;
}

@end
