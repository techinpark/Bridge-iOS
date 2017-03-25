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
#import "APIModel.h"

@interface MainViewController () <SlideNavigationControllerDelegate, SWTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UITableView *mainTV;
@property (weak, nonatomic) IBOutlet UIView *swipeLineView;
@property (strong, nonatomic) NSArray *arrRecordCoast;
@property (strong, nonatomic) NSArray *arrSendingRecordCoast;
@property (strong, nonatomic) NSArray *arrNeedReceiveName;
@property (strong, nonatomic) NSArray *arrMoneyTypeName;
@property (weak, nonatomic) IBOutlet UILabel *totalCoastLabel;
@property (weak, nonatomic) IBOutlet UIButton *receiveMoneyLabel;
@property (weak, nonatomic) IBOutlet UIButton *sendMoneyLabel;

@property BOOL receiveMoneyPageYN;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //title
    UIImageView *billyTitImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Billy"]];
    self.navigationItem.titleView = billyTitImageView;


    self.arrRecordCoast = @[@"76,000원", @"55,000원", @"35,000원", @"40,000원", @"50,000원"];
    self.arrSendingRecordCoast = @[@"36,000원", @"15,000원", @"25,000원", @"40,000원", @"55,000원"];
    self.arrNeedReceiveName = @[@"최윤정", @"한기호", @"조현진", @"조현진", @"박태진"];
    self.arrMoneyTypeName = @[@"동아리회비", @"더치페이", @"점심값", @"빌려준돈", @"책값"];

    [self.mainTV reloadData];
    [self setNavi];

    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    self.swipeLineView.frame = CGRectMake(15.0f, self.swipeLineView.frame.origin.y, width/2.0 - 30.0f, 1.0);
    
    
    APIModel *apiModel = [[APIModel alloc] init];
    NSDictionary *result = [apiModel moneyBalance:@"1"];
    NSLog(@"%@",result);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)rightClick:(UIButton*)button {
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.receiveMoneyLabel.titleLabel.textColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.6];

    self.totalCoastLabel.text = @"55,000원";
    self.receiveMoneyPageYN = NO;

    [self setConditionAnimate:[UIColor colorWithRed:(70/255.0) green:(171/255.0) blue:(191/255.0) alpha:1.0f] duration:0.3];

    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    self.swipeLineView.frame = CGRectMake(width/2.0f + 15.0f, self.swipeLineView.frame.origin.y
, width/2.0 - 30.0f, 1.0);
    [UIView commitAnimations];
}

- (IBAction)leftClick:(UIButton *)button {
    button.titleLabel.textColor = [UIColor whiteColor];
    self.sendMoneyLabel.titleLabel.textColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.6];

    self.totalCoastLabel.text = @"75,000원";
    self.receiveMoneyPageYN = YES;

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
    [self performSegueWithIdentifier:@"moveRecordVC" sender:self];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrRecordCoast.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setRightUtilityButtons:[self rightButtons] WithButtonWidth:80.0f];
    
    cell.coastLabel.text = [self.arrRecordCoast objectAtIndex:indexPath.row];
    cell.nameLabel.text = [self.arrNeedReceiveName objectAtIndex:indexPath.row];
    cell.moneyTypeLabel.text = [self.arrMoneyTypeName objectAtIndex:indexPath.row];

    if(indexPath.row == 0) {
        cell.creditGradeImageView.hidden = NO;
    }
    /*NSMutableAttributedString *coast = [[NSMutableAttributedString alloc] initWithString:@"원"];
    [coast addAttribute:NSFontAttributeName
                  value:[UIFont systemFontOfSize:23.0]
                  range:NSMakeRange(0 , cell.coastLabel.text.length - 2)];
    [cell.coastLabel setAttributedText:coast];*/
    cell.delegate = self;
    return cell;
}

- (NSArray *)rightButtons {
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:[UIColor colorWithRed:(240/255.0) green:(168/255.0) blue:(9/255.0) alpha:1.0f] icon:[UIImage imageNamed:@"alarm"]];
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
    
    //UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    //[button setImage:[UIImage imageNamed:@"gear"] forState:UIControlStateNormal];
    //[button addTarget:[SlideNavigationController sharedInstance] action:@selector(toggleRightMenu) forControlEvents:UIControlEventTouchUpInside];
    //UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];

    //left
    //right
    UIButton *btnRightNavi = [UIButton buttonWithType:UIButtonTypeCustom];
    btnRightNavi.bounds = CGRectMake(5.0f, 0, 30.0f, 30.0f);
    [btnRightNavi addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [btnRightNavi setImage:[UIImage imageNamed:@"billy_alarm"] forState:UIControlStateNormal];
    [btnRightNavi setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *barBtnRightNavi = [[UIBarButtonItem alloc] initWithCustomView:btnRightNavi];
    self.navigationItem.rightBarButtonItem = barBtnRightNavi;
}

- (void)test {
    [self performSegueWithIdentifier:@"moveReceiveMoney" sender:self];
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
