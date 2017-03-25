//
//  MainTableViewCell.h
//  Bridge
//
//  Created by admin on 2017. 3. 26..
//  Copyright © 2017년 tmsae. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"

@interface MainTableViewCell : SWTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *coastLabel;
@property (weak, nonatomic) IBOutlet UIImageView *creditGradeImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyTypeLabel;

@end
