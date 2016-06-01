//
//  StatesHeaderView.h
//  LoveFlyHome
//
//  Created by gpf on 16/6/1.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatesHeaderView : UIView
@property (nonatomic, strong) UIImageView * titleImage;
@property (nonatomic, strong) UILabel * label1;
@property (nonatomic, strong) UILabel * label2;
@property (nonatomic, strong) UILabel * label3;
@property (nonatomic, strong) UILabel * label4;
@property (nonatomic, strong) UILabel * label5;
@property (nonatomic, strong) UIImageView * statesListImage;

+ (instancetype)statesHeaderViewMake:(UITableView *)tableView;

@end
