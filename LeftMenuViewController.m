//
//  MenuViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"
#import "LeftMenuTableViewCell.h"

@interface LeftMenuViewController ()
@property (strong, nonatomic) NSArray *arrMenuImage;
@end

@implementation LeftMenuViewController

#pragma mark - UIViewController Methods -

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self.slideOutAnimationEnabled = YES;
	return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.tableView.separatorColor = [UIColor lightGrayColor];
	
    self.arrMenuImage = @[@"home", @"mine", @"money_call", @"money_send"];

	//UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu"]];
	//self.tableView.backgroundView = imageView;
}

#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.arrMenuImage.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 20)];
	view.backgroundColor = [UIColor clearColor];
	return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	LeftMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leftMenuCell"];

    cell.menuImageView.image = [UIImage imageNamed:[self.arrMenuImage objectAtIndex:indexPath.row]];
    switch (indexPath.row) {
		case 0:
			cell.menuNameLabel.text = @"메인화면";
			break;
		case 1:
			cell.menuNameLabel.text = @"받을 돈 요청하기";
			break;
		case 2:
			cell.menuNameLabel.text = @"보낼 돈 요청하기";
			break;
		case 3:
			cell.menuNameLabel.text = @"나의 거래내역 조회";
			break;
	}
	
	cell.backgroundColor = [UIColor clearColor];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone"
															 bundle: nil];
	
	UIViewController *vc ;
	
	switch (indexPath.row)
	{
		case 0:
			vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"HomeViewController"];
			break;
			
		case 1:
			vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"ProfileViewController"];
			break;
		case 2:
			vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"FriendsViewController"];
			break;
		case 3:
			[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
			[[SlideNavigationController sharedInstance] popToRootViewControllerAnimated:YES];
			return;
			break;
	}
	
	[[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
															 withSlideOutAnimation:self.slideOutAnimationEnabled
																	 andCompletion:nil];
}

@end
