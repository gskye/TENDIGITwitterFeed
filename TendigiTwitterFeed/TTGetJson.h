//
//  TTGetJson.h
//  TendigiTwitterFeed
//
//  Created by Skye Freeman on 5/18/14.
//  Copyright (c) 2014 SkyeFreeman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTGetJson : NSObject

@property (strong) NSArray *fetchedData;
-(id)initWithJson:(NSString*)jsonURL;

@end
