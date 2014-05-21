//
//  TTTwitterFeed.m
//  TendigiTwitterFeed
//
//  Created by Skye Freeman on 5/20/14.
//  Copyright (c) 2014 SkyeFreeman. All rights reserved.
//

#import "TTTwitterFeed.h"

@implementation TTTwitterFeed

-(id)init {
	return self;
}

-(id)initWithDescription:(NSString*)description
				location:(NSString*)location
					 URL:(NSString*)url
			profileImage:(UIImage*)pImage
{
	self = [super init];
	
	if (self) {
		self.feedDescription = description;
		self.feedLocation = location;
		self.feedCompanyURL = url;
		self.feedProfileImage = pImage;
	}
	return self;
}

@end
