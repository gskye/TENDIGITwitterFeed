//
//  TTTweetCell.h
//  TendigiTwitterFeed
//
//  Created by Skye Freeman on 5/19/14.
//  Copyright (c) 2014 SkyeFreeman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTTweet.h"

extern NSString *const TTTweetCellReuseIdentifier;
extern CGFloat const TTTweetCellHeight;

@interface TTTweetCell : UITableViewCell

-(void)configureCellWithTweetObject:(TTTweet*)tweet;

@end
