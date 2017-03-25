//
//  MainViewController.m
//  Bridge
//
//  Created by admin on 2017. 3. 25..
//  Copyright © 2017년 tmsae. All rights reserved.
//

#import "MainViewController.h"
#import "SlideNavigationController.h"
#import "MainTableViewCell.h"

@interface MainViewController () <SlideNavigationControllerDelegate, SWTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UITableView *mainTV;
@property (weak, nonatomic) IBOutlet UIView *swipeLineView;
@property (strong, nonatomic) NSArray *arrRecordCoast;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrRecordCoast = [NSArray arrayWithObjects: @"76,000", "55,000", "35,000", "40,000", "50,000", nil];

    출처: http://nolran.tistory.com/6 [맛집도 좋고 개발도 좋고~]
    [self setNavi];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    self.swipeLineView.frame = CGRectMake(15.0f, self.swipeLineView.frame.origin.y, width/2.0 - 30.0f, 1.0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)rightClick:(id)sender {
    [self setConditionAnimate:[UIColor colorWithRed:(70/255.0) green:(171/255.0) blue:(191/255.0) alpha:1.0f] duration:0.3];

    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    self.swipeLineView.frame = CGRectMake(width/2.0f + 15.0f, self.swipeLineView.frame.origin.y
, width/2.0 - 30.0f, 1.0);
    [UIView commitAnimations];
}

- (IBAction)leftClick:(id)sender {
    [self setConditionAnimate:[UIColor colorWithRed:(41/255.0) green:(130/255.0) blue:(255/255.0) alpha:1.0f] duration:0.3];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    self.swipeLineView.frame = CGRectMake(15.0f, self.swipeLineView.frame.origin.y
                                          , width/2.0 - 30.0f, 1.0);
    [UIView commitAnimations];
}

- (void)setAnimate:(CGRect)rect duration:(CGFloat)duration {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    //self.swipeLineView.frame = CGRectMake(rect);
    [UIView commitAnimations];
}

- (void)setConditionAnimate:(UIColor*)color duration:(CGFloat)duration {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    self.headerView.backgroundColor = color;
    //self.swipeLineView.frame = CGRectMake(rect);
    [UIView commitAnimations];
}

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    return YES;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"moveRecordDetail" sender:self];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrRecordCoast.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainTableViewCell"];
    [cell setRightUtilityButtons:[self rightButtons] WithButtonWidth:80.0f];
    
    NSMutableAttributedString *coast = [[NSMutableAttributedString alloc] initWithString:@"원"];

    //cell.coastLabel

    //cell.NSMutableAttributedString
    //NSMutableAttributedString

    cell.delegate = self;

    return cell;
}

- (NSArray *)rightButtons {
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:[UIColor colorWithRed:(240/255.0) green:(168/255.0) blue:(9/255.0) alpha:1.0f] icon:[UIImage imageNamed:@"test"]];
    return rightUtilityButtons;
}
- (BOOL)swipeableTableViewCell:(SWTableViewCell *)cell canSwipeToState:(SWCellState)state {
    return YES;
}
- (void)swipeableTableViewCell:(SWTableViewCell *)cell scrollingToState:(SWCellState)state {
    NSLog(@"scrollingToState");
}
- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell {
    return YES;
}
- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
}

- (void)setNavi {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
