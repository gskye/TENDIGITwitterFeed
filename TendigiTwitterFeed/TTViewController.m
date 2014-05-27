//
//  TTViewController.m
//  TendigiTwitterFeed
//
//  Created by Skye Freeman on 5/16/14.
//  Copyright (c) 2014 SkyeFreeman. All rights reserved.
//

#import "TTViewController.h"
#import "TTTweetCell.h"
#import "TTTwitterFeedHeadCell.h"
#import "TTImage.h"
#import "TTTwitterFeed.h"

@interface TTViewController () <UITableViewDelegate , UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation TTViewController {
	UIRefreshControl *refreshControl;
}

-(void)awakeFromNib {
	[super awakeFromNib];
	self.allTweets = [NSArray new];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
	[self addPullToRefresh];
	[self registerNibs];
	[self subscribeToNotifications];
	
	[refreshControl beginRefreshing];
	[self retrieveTweetData];
}

-(void)registerNibs {
	[self.tableView registerNib:[UINib nibWithNibName:@"TTTweetCell" bundle:nil]
		 forCellReuseIdentifier:TTTweetCellReuseIdentifier];
	[self.tableView registerNib:[UINib nibWithNibName:@"TTTwitterFeedHeadCell" bundle:nil] forCellReuseIdentifier:TTTwitterFeedHeadCellReuseIdentifier];
}


-(void)subscribeToNotifications {
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(dataRetrieved)
												 name:@"initWithJSONFinishedLoading"
											   object:nil];
}

-(void)addPullToRefresh {
	refreshControl = [[UIRefreshControl alloc] init];
	[refreshControl addTarget:self
					   action:@selector(retrieveTweetData)
			 forControlEvents:UIControlEventValueChanged];
	[self.tableView addSubview:refreshControl];
}

#pragma mark - getting tweets

-(void)retrieveTweetData {
	self.json = [[TTGetJson alloc] init];
}

-(void)dataRetrieved {
	NSLog(@"data was retrieved");
	
	NSMutableArray *tempArray = [[NSMutableArray alloc] init];
	NSMutableArray *allData = [[NSMutableArray alloc] init];
	for (NSDictionary *data in self.json.fetchedData) {
		
		[allData addObject:data];
		[tempArray addObject:[self createTweetWithData:data]];
		
	}
	[self createTwitterFeedHeadWithData:allData[0]];
	self.allTweets = tempArray;

	[refreshControl endRefreshing];
	[self.tableView reloadData];
}

-(void)createTwitterFeedHeadWithData:(NSDictionary*)data {
	NSString *pImageString = [NSString stringWithFormat:@"%@",data[@"user"][@"profile_image_url"]];

	UIImage *pImage = [self loadImageWithString:pImageString];
		
	self.feedHead = [[TTTwitterFeed alloc] initWithDescription:data[@"user"][@"description"]
													  location:data[@"user"][@"location"]
														   URL:data[@"user"][@"entities"][@"url"][@"urls"][0][@"display_url"]
												  profileImage:pImage];
}

-(UIImage*)loadImageWithString:(NSString*)string {
	NSURL *url = [NSURL URLWithString:string];
	NSData *imageData = [NSData dataWithContentsOfURL:url];
	UIImage *downloadedImage = [[UIImage alloc] initWithData:imageData];
	
	NSLog(@"Downloaded");
	return downloadedImage;
}

-(TTTweet*)createTweetWithData:(NSDictionary*)data {
	TTTweet *newTweet = [[TTTweet alloc] initWithText:data[@"text"]
												 date:data[@"created_at"]
										   screenName:data[@"user"][@"screen_name"]];
	return newTweet;
}

#pragma mark - Convenience Methods
-(TTTweet*)tweetObjectAtIndex:(NSIndexPath *)index {
	return self.allTweets[index.row];
}

#pragma mark - UITableViewDelegate Methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{

    return [self.allTweets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	id cell = nil;
	switch (indexPath.row) {
		case 0:
			cell = [tableView dequeueReusableCellWithIdentifier:TTTwitterFeedHeadCellReuseIdentifier];
			[cell configureHeadCellWithFeedObject:self.feedHead];
			break;
		default:
			cell = [tableView dequeueReusableCellWithIdentifier:TTTweetCellReuseIdentifier];
			TTTweet *tweet = [self tweetObjectAtIndex:indexPath];
			[cell configureCellWithTweetObject:tweet];
			break;
	}
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.row == 0) {
		return TTTwitterFeedHeadCellHeight;
	}
	return TTTweetCellHeight;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
