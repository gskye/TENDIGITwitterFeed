//
//  TTTweetCell.m
//  TendigiTwitterFeed
//
//  Created by Skye Freeman on 5/19/14.
//  Copyright (c) 2014 SkyeFreeman. All rights reserved.
//

#import "TTTweetCell.h"

NSString * const TTTweetCellReuseIdentifier = @"TTTweetCellReuseIdentifier";
CGFloat const TTTweetCellHeight = 125.0f;

@interface TTTweetCell ()

@property (nonatomic,strong) IBOutlet UILabel *name;
@property (nonatomic,strong) IBOutlet UILabel *screenName;
@property (nonatomic,strong) IBOutlet UILabel *date;
@property (nonatomic,strong) IBOutlet UITextView *text;
@property (nonatomic,strong) IBOutlet UIImageView *profileImage;

//profileTitle;
//dateOfTweet;
//profileImageURL;
//tweetText;
//profileScreenName;
@end

@implementation TTTweetCell

- (void)awakeFromNib
{
	[super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCellWithTweetObject:(TTTweet *)tweet {
	[self.name setText:tweet.profileTitle];
	[self.screenName setText:tweet.profileScreenName];
	[self.date setText:tweet.dateOfTweet];
	[self.text setText:tweet.tweetText];

}

@end
