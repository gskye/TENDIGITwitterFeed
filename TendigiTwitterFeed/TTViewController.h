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

@interface TTViewController : UIViewController

@property (nonatomic, strong) TTGetJson *json;
@property (nonatomic, strong) TTTweet *tweet;
@property (nonatomic, strong) NSArray *allTweets;

@end
