//
//  RequestSendingMoneyVC.m
//  Bridge
//
//  Created by admin on 2017. 3. 26..
//  Copyright © 2017년 tmsae. All rights reserved.
//

#import "RequestSendingMoneyVC.h"

@interface RequestSendingMoneyVC ()
@property (nonatomic, strong) IBOutlet UIView *contentView;
@property (nonatomic, strong) IBOutlet UIScrollView *mScrollView;

@end

@implementation RequestSendingMoneyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = YES;
    
    
    
    
    [self.view addSubview:self.mScrollView];
    
    [self.mScrollView addSubview:self.contentView];
    [self.mScrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.contentView.frame.size.height)];
    
    
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

- (IBAction)onBackButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBarHidden = NO;
}

@end
