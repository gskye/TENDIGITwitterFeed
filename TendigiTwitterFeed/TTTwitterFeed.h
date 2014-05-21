//
//  TTTwitterFeed.h
//  TendigiTwitterFeed
//
//  Created by Skye Freeman on 5/20/14.
//  Copyright (c) 2014 SkyeFreeman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTTwitterFeed : NSObject

@property (nonatomic,strong) UIImage *feedProfileImage;
@property (nonatomic,strong) NSString *feedDescription;
@property (nonatomic,strong) NSString *feedLocation;
@property (nonatomic,strong) NSString *feedCompanyURL;

-(id)initWithDescription:(NSString*)description
				location:(NSString*)location
					 URL:(NSString*)url
			profileImage:(UIImage*)pImage;
@end
