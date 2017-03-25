//
//  MainViewController.m
//  Bridge
//
//  Created by admin on 2017. 3. 25..
//  Copyright © 2017년 tmsae. All rights reserved.
//

#import "MainViewController.h"
#import "SlideNavigationController.h"

@interface MainViewController () <SlideNavigationControllerDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
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
