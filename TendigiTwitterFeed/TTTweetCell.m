//
//  TTTweetCell.m
//  TendigiTwitterFeed
//
//  Created by Skye Freeman on 5/19/14.
//  Copyright (c) 2014 SkyeFreeman. All rights reserved.
//

#import "TTTweetCell.h"

NSString * const TTTweetCellReuseIdentifier = @"TTTweetCellReuseIdentifier";
@interface TTTweetCell ()

@property (nonatomic,strong) IBOutlet UITextField *name;
@property (nonatomic,strong) IBOutlet UITextField *screenName;
@property (nonatomic,strong) IBOutlet UITextField *date;
@property (nonatomic,strong) IBOutlet UITextView *text;
@property (nonatomic,strong) IBOutlet UIImageView *profileImage;

@end

@implementation TTTweetCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCellWithTweetObject:(TTTweet *)tweet {
	
}

@end
