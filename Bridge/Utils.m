//
//  Utils.m
//  Bridge
//
//  Created by admin on 2017. 3. 26..
//  Copyright © 2017년 tmsae. All rights reserved.
//

#import "Utils.h"

@implementation Utils
+ (void)alertMessage:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil
                                                   message:message
                                                  delegate:self
                                         cancelButtonTitle:@"확인"
                                         otherButtonTitles:nil, nil];
    [alert show];
}
@end
