//
//  TTViewController.m
//  TendigiTwitterFeed
//
//  Created by Skye Freeman on 5/16/14.
//  Copyright (c) 2014 SkyeFreeman. All rights reserved.
//

#import "TTViewController.h"
#import "TTTweetCell.h"

@interface TTViewController () <UITableViewDelegate , UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UIImageView *cityImageClear;
@property (nonatomic, strong) IBOutlet UIImageView *cityImageBlur;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation TTViewController

-(void)awakeFromNib {
	[super awakeFromNib];
	self.allTweets = [NSArray new];
}

//-(void)viewDidAppear:(BOOL)animated {
//	[super viewDidAppear:animated];
//	
//}

-(void)viewDidLoad
{
    [super viewDidLoad];
	[self retrieveTweetData];
	[self registerNibs];
	[self subscribeToNotifications];
}

-(void)registerNibs {
	[self.tableView registerNib:[UINib nibWithNibName:@"TTTweetCell" bundle:nil]
		 forCellReuseIdentifier:TTTweetCellReuseIdentifier];
}

-(void)retrieveTweetData {
	self.json = [[TTGetJson alloc] init];
}

-(void)subscribeToNotifications {
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(dataRetrieved)
												 name:@"initWithJSONFinishedLoading"
											   object:nil];
}

-(void)dataRetrieved {
	NSLog(@"data was retrieved");
	
	NSMutableArray *tempArray = [[NSMutableArray alloc] init];
	for (NSDictionary *data in self.json.fetchedData) {
		TTTweet *newTweet = [[TTTweet alloc] initWithTitle:data[@"user"][@"name"]
													  date:data[@"created_at"]
													 image:data[@"user"][@"profile_image_url_https"]
													  text:data[@"text"]
												screenName:data[@"user"][@"screen_name"]];
		[tempArray addObject:newTweet];
	}
	self.allTweets = tempArray;

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

    return [self.allTweets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	id cell = nil;
	switch (indexPath.row) {
		default:
			
			for (TTTweet *tweet in self.allTweets) {
				NSLog(@"%@",tweet);
			}
			
			cell = [tableView dequeueReusableCellWithIdentifier:TTTweetCellReuseIdentifier];
			TTTweet *tweet = [self tweetObjectAtIndex:indexPath];
			NSLog(@"%@",tweet.profileTitle);
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
	return TTTweetCellHeight;
}

#pragma mark - Convenience Methods
-(TTTweet*)tweetObjectAtIndex:(NSIndexPath *)index {
	return self.allTweets[index.row];
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
