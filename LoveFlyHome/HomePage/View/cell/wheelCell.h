//
//  HomePageCtrl.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/5/26.
//  Copyright © 2016年 Lefeng. All rights reserved.


#import <UIKit/UIKit.h>
#import "WheelImageView.h"
@interface wheelCell : UITableViewCell
@property(strong,nonatomic)WheelImageView *wheelView;
@property(strong,nonatomic)NSMutableArray *menuarry;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;


@end
