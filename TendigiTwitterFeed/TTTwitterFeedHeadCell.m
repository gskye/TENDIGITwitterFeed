//
//  TTTwitterFeedHeadCell.m
//  TendigiTwitterFeed
//
//  Created by Skye Freeman on 5/20/14.
//  Copyright (c) 2014 SkyeFreeman. All rights reserved.
//

#import "TTTwitterFeedHeadCell.h"

NSString *const TTTwitterFeedHeadCellReuseIdentifier = @"TTTwitterFeedHeadCellReuseIdentifier";
CGFloat const TTTwitterFeedHeadCellHeight = 200.0f;

@implementation TTTwitterFeedHeadCell

- (void)awakeFromNib
{
	[super awakeFromNib];
}

-(void)configureHeadCellWithFeedObject:(TTTwitterFeed*)feed {
	[self.feed_description setText:feed.feedDescription];
	[self.location setText:feed.feedLocation];
	[self.company setText:feed.feedCompanyURL];
	[self.profile_image setImage:feed.feedProfileImage];
}


@end
