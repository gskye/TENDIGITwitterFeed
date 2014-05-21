//
//  TTImage.h
//  TendigiTwitterFeed
//
//  Created by Skye Freeman on 5/20/14.
//  Copyright (c) 2014 SkyeFreeman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface TTImage : NSObject <NSURLConnectionDelegate>

@property (strong,nonatomic) UIImage *image;
@property (strong,nonatomic) NSMutableData *imageData;

-(id)initWithImageString:(NSString*)string;

@end
