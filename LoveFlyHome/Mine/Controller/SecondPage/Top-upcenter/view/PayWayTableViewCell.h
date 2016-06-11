//
//  PayWayTableViewCell.h
//  LoveFlyHome
//
//  Created by Eclectic on 16/6/9.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayWayTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *titleImageView;
@property (weak, nonatomic) IBOutlet UILabel *payNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
//@property (weak, nonatomic) IBOutlet UIButton *checkedButton;

@property (weak, nonatomic) IBOutlet UIImageView *checkedImageView;
@end
