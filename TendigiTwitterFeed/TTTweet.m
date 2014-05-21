//
//  TTTweets.m
//  TendigiTwitterFeed
//
//  Created by Skye Freeman on 5/18/14.
//  Copyright (c) 2014 SkyeFreeman. All rights reserved.
//

#import "TTTweet.h"

@implementation TTTweet

-(id)init {
	self = [self initWithText:@"defaultText"
						  date:@"defaultDate"
					screenName:@"defaultScreenName"];
	return self;
}


-(id)initWithText:(NSString *)tweetText
			 date:(NSString *)dateOfTweet
	   screenName:(NSString *)profileScreenName {
	
	self = [super init];
	
	if (self) {
		
		self.dateOfTweet = dateOfTweet;
		self.tweetText = tweetText;
		self.profileScreenName = profileScreenName;
		
//		NSLog(@"%@,%@,%@,%@,%@",self.profileTitle,self.dateOfTweet,self.profileImageURL,self.tweetText,self.profileScreenName);
	}
	
	return self;
}


@end
