//
//  TTViewController.m
//  TendigiTwitterFeed
//
//  Created by Skye Freeman on 5/16/14.
//  Copyright (c) 2014 SkyeFreeman. All rights reserved.
//

#import "TTViewController.h"

@interface TTViewController () <UITableViewDelegate , UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UIImageView *cityImageClear;
@property (nonatomic, strong) IBOutlet UIImageView *cityImageBlur;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation TTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	self.json = [[TTGetJson alloc] init];
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(dataRetrieved)
												 name:@"initWithJSONFinishedLoading"
											   object:nil];
}

-(void)dataRetrieved {
	NSLog(@"data was retrieved");
	
	NSMutableArray *tempArray = [NSMutableArray alloc];
	for (NSDictionary *data in self.json.fetchedData) {
		TTTweet *newTweet = [[TTTweet alloc] initWithTitle:data[@"user"][@"name"]
													  date:data[@"user"][@"created_at"]
													 image:data[@"profile_image_url_https"]
													  text:data[@"text"]
												screenName:data[@"screen_name"]];
		[tempArray addObject:newTweet];
	}
	self.allTweets = [[NSArray alloc] initWithArray:tempArray];
	
	[self.tableView reloadData];
}

#pragma mark - UITableViewDelegate Methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.allTweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
	}
    
    // Configure the cell
	cell.backgroundColor = [UIColor clearColor];
	cell.textLabel.textColor = [UIColor whiteColor];
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	//Getting and setting the fetched strings from the JSON data
	
}

#pragma mark - UIScrollView Delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
	CGFloat scrollViewYOffset = scrollView.contentOffset.y;
    CGFloat screenHeight = CGRectGetHeight([UIScreen mainScreen].bounds);
    CGFloat newAlpha = scrollViewYOffset / screenHeight;
    [self.cityImageBlur setAlpha:newAlpha];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
