//
//  FlashyTableViewController.m
//  FlashyTableviews
//
//  Created by Matt Amerige on 6/29/16.
//  Copyright © 2016 Wubbyland. All rights reserved.
//

#import "FlashyTableViewController.h"
#import <SWTableViewCell.h>
#import "UIScrollView+APParallaxHeader.h"

static NSString *cellIdentifier = @"Cell";

@interface FlashyTableViewController () <SWTableViewCellDelegate>

@end

@implementation FlashyTableViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self _addParallax];
}

- (void)_addParallax
{
	 [self.tableView addParallaxWithImage:[UIImage imageNamed:@"annoyingdog.png"] andHeight:160 andShadow:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	SWTableViewCell *cell = (SWTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	cell.leftUtilityButtons = [self leftButtons];
	cell.rightUtilityButtons = [self rightButtons];
	cell.delegate = self;
	
	cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
	cell.detailTextLabel.text = @"Some detail text";
	
	return cell;
}

- (NSArray *)rightButtons
{
	NSMutableArray *rightUtilityButtons = [NSMutableArray new];
	[rightUtilityButtons sw_addUtilityButtonWithColor:
	 [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
																							title:@"More"];
	[rightUtilityButtons sw_addUtilityButtonWithColor:
	 [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
																							title:@"Delete"];
	
	return rightUtilityButtons;
}

- (NSArray *)leftButtons
{
	NSMutableArray *leftUtilityButtons = [NSMutableArray new];
	
	[leftUtilityButtons sw_addUtilityButtonWithColor:
	 [UIColor colorWithRed:0.07 green:0.75f blue:0.16f alpha:1.0]
																							icon:[UIImage imageNamed:@"check.png"]];
	[leftUtilityButtons sw_addUtilityButtonWithColor:
	 [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:1.0]
																							icon:[UIImage imageNamed:@"clock.png"]];
	[leftUtilityButtons sw_addUtilityButtonWithColor:
	 [UIColor colorWithRed:1.0f green:0.231f blue:0.188f alpha:1.0]
																							icon:[UIImage imageNamed:@"cross.png"]];
	[leftUtilityButtons sw_addUtilityButtonWithColor:
	 [UIColor colorWithRed:0.55f green:0.27f blue:0.07f alpha:1.0]
																							icon:[UIImage imageNamed:@"list.png"]];
	
	return leftUtilityButtons;
}

#pragma mark - SWTableViewCell Delegate Methods

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index
{
	NSLog(@"Something happend");
}

@end



















