//
//  LFHDetailViewCell.h
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/8.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFHDetailViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *PayWay;

@property (weak, nonatomic) IBOutlet UILabel *PayTimes;
@property (weak, nonatomic) IBOutlet UILabel *AmountOf;
@end
