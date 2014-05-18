//
//  TTTweets.h
//  TendigiTwitterFeed
//
//  Created by Skye Freeman on 5/18/14.
//  Copyright (c) 2014 SkyeFreeman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTTweet : NSObject

@property (strong, nonatomic) NSString *profileTitle;
@property (strong, nonatomic) NSString *dateOfTweet;
@property (strong, nonatomic) NSString *profileImageURL;
@property (strong, nonatomic) NSString *tweetText;
@property (strong, nonatomic) NSString *profileScreenName;

-(id)initWithTitle:(NSString*)profileTitle
			  date:(NSString*)dateOfTweet
			 image:(NSString*)profileImageURL
			  text:(NSString*)tweetText
		screenName:(NSString*)profileScreenName;

@end