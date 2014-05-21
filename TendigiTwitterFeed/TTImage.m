//
//  TTImage.m
//  TendigiTwitterFeed
//
//  Created by Skye Freeman on 5/20/14.
//  Copyright (c) 2014 SkyeFreeman. All rights reserved.
//

#import "TTImage.h"

@implementation TTImage

-(id)init {
	self = [super init];

	return self;
}

-(id)initWithImageString:(NSString *)string {
	self = [super init];
	
	if (self) {
		NSURL *url = [NSURL URLWithString:string];
		NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
		NSURLConnection* conn = [[NSURLConnection alloc] initWithRequest:req
																delegate:self
														startImmediately:TRUE];
	}
	
	return self;
}

#pragma mark - URL Connection Delegate

-(void)connection:(NSURLConnection*)cn didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"Received response %@ %lld", response.URL, response.expectedContentLength);
	self.imageData = [[NSMutableData alloc] init];
}

-(void)connection:(NSURLConnection*)cn didReceiveData:(NSData*)data
{
	[self.imageData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection*)connection
{
	self.image = [UIImage imageWithData:self.imageData];
}

@end
