//
//  TTTweetCell.m
//  TendigiTwitterFeed
//
//  Created by Skye Freeman on 5/19/14.
//  Copyright (c) 2014 SkyeFreeman. All rights reserved.
//

#import "TTTweetCell.h"
#import "NSDate+TimeAgo.h"

NSString * const TTTweetCellReuseIdentifier = @"TTTweetCellReuseIdentifier";
CGFloat const TTTweetCellHeight = 75.0f;

@interface TTTweetCell ()

@property (nonatomic,strong) IBOutlet UILabel *screenName;
@property (nonatomic,strong) IBOutlet UILabel *date;
@property (nonatomic,strong) IBOutlet UITextView *text;

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
	[self.screenName setText:[NSString stringWithFormat:@"@%@",tweet.profileScreenName]];
	[self.date setText:[self dateFormatWithString:tweet.dateOfTweet]];
	[self.text setText:tweet.tweetText];
}

-(NSString*)dateFormatWithString:(NSString*)date {
	NSDateFormatter *format = [[NSDateFormatter alloc] init];
	[format setDateFormat:@"EEE MMM dd HH:mm:ss '+0000' yyyy"];
	[format setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
	
	NSDate *dateToFormat = [format dateFromString:date];
	NSTimeInterval timeInterval = [dateToFormat timeIntervalSinceNow];
	NSDate *dateOfTweet = [[NSDate alloc] initWithTimeIntervalSinceNow:timeInterval];
	NSString *ago = [dateOfTweet dateTimeAgo];
	
	NSLog(@"%@",ago);
	return ago;
}

@end
