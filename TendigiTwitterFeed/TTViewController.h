//
//  TTViewController.h
//  TendigiTwitterFeed
//
//  Created by Skye Freeman on 5/16/14.
//  Copyright (c) 2014 SkyeFreeman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTGetJson.h"
#import "TTTweet.h"
#import "TTTwitterFeed.h"

@interface TTViewController : UIViewController <NSURLConnectionDelegate>

@property (nonatomic, strong) TTGetJson *json;
@property (nonatomic, strong) TTTwitterFeed *feedHead;
@property (nonatomic, strong) NSArray *allTweets;

@end
