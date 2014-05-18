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
	self = [self initWithTitle:@"defaultTitle"
						  date:@"defaultName"
						 image:@"defaultImage"
						  text:@"defaultText"
					screenName:@"defaultScreenName"];
	return self;
}


-(id)initWithTitle:(NSString *)profileTitle
			  date:(NSString *)dateOfTweet
			 image:(NSString *)profileImageURL
			  text:(NSString *)tweetText
		screenName:(NSString *)profileScreenName {
	
	self = [super init];
	
	if (self) {
		
		self.profileTitle = profileTitle;
		self.dateOfTweet = dateOfTweet;
		self.profileImageURL = profileImageURL;
		self.tweetText = tweetText;
		self.profileScreenName = profileScreenName;
		
	}
	
	
	
	return self;
}


@end
