//
//  TTTwitterFeedHeadCell.h
//  TendigiTwitterFeed
//
//  Created by Skye Freeman on 5/20/14.
//  Copyright (c) 2014 SkyeFreeman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTTweet.h"
#import "TTTwitterFeed.h"

extern NSString *const TTTwitterFeedHeadCellReuseIdentifier;
extern CGFloat const TTTwitterFeedHeadCellHeight;

@interface TTTwitterFeedHeadCell : UITableViewCell

@property (nonatomic,strong) IBOutlet UIImageView *profile_image;
@property (nonatomic,strong) IBOutlet UILabel *location;
@property (nonatomic,strong) IBOutlet UILabel *company;
@property (nonatomic,strong) IBOutlet UITextView *feed_description;

-(void)configureHeadCellWithFeedObject:(TTTwitterFeed*)feed;

@end
