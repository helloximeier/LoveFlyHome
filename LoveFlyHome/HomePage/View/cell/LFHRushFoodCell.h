//
//  LFHRushFoodCell.h
//  LoveFlyHome
//
//  Created by Lefeng on 16/5/31.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFHRushFoodCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *LFHfoodImg;

@property (weak, nonatomic) IBOutlet UILabel *LFHfoodName;

@property (weak, nonatomic) IBOutlet UIButton *LFHRudhTime;

+ (instancetype)cellWithTableView:(UITableView *)tableview;
@end
