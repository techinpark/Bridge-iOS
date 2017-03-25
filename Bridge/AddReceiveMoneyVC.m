//
//  AddReceiveMoneyVC.m
//  Bridge
//
//  Created by admin on 2017. 3. 26..
//  Copyright © 2017년 tmsae. All rights reserved.
//

#import "AddReceiveMoneyVC.h"
#import "SlideNavigationController.h"

@interface AddReceiveMoneyVC ()

@end

@implementation AddReceiveMoneyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"받을 돈 등록하기";
    
    [self setNavi];
}

- (void)setNavi {
    UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [button setImage:[UIImage imageNamed:@"left-arrow"] forState:UIControlStateNormal];
    [button addTarget:[SlideNavigationController sharedInstance] action:@selector(closePage:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    //self.navigationItem.rightBarButtonItem = barBtnRightNavi;
}

- (IBAction)closePage:(id)sender {
    NSLog(@"closePage222");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)closePage {
    NSLog(@"closePage");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
