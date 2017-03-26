//
//  InputPasswordViewController.m
//  Bridge
//
//  Created by admin on 2017. 3. 26..
//  Copyright © 2017년 tmsae. All rights reserved.
//

#import "InputPasswordViewController.h"
#import "Utils.h"

@interface InputPasswordViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *sendingCoastLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation InputPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)closePageAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)clickPaswordAction:(UIButton *)button {
    self.passwordTextField.text = [self.passwordTextField.text stringByAppendingString:button.titleLabel.text];
    NSLog(@"button.titleLabel.text %@", button.titleLabel.text);
    
    if(self.passwordTextField.text.length > 4) {
        if([self.passwordTextField.text isEqualToString:@"44444"]) {
            [Utils alertMessage:@"송금이 완료되었습니다."];
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            [Utils alertMessage:@"비밀번호가 틀렸습니다."];
            self.passwordTextField.text = @"";
        }
    }
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
