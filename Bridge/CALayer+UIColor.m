//
//  CALayer+UIColor.m
//  Bridge
//
//  Created by Techin Park on 2017. 3. 26..
//  Copyright © 2017년 tmsae. All rights reserved.
//

#import "CALayer+UIColor.h"

@implementation CALayer(UIColor)

- (void)setBorderUIColor:(UIColor*)color {
    self.borderColor = color.CGColor;
}

- (UIColor*)borderUIColor {
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
