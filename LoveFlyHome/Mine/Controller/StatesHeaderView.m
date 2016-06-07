//
//  StatesHeaderView.m
//  LoveFlyHome
//
//  Created by gpf on 16/6/1.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "StatesHeaderView.h"

@implementation StatesHeaderView

+ (instancetype)statesHeaderViewMake:(UITableView *)tableView{
    StatesHeaderView * headerView = [[StatesHeaderView alloc] init];
    headerView.frame = CGRectMake(0, 0, tableView.frame.size.width, 130);
    [headerView addControl];
    
    return headerView;
}

/*
 @property (nonatomic, strong) UIImageView * titleImage;
 @property (nonatomic, strong) UILabel * label1;
 @property (nonatomic, strong) UILabel * label2;
 @property (nonatomic, strong) UILabel * label3;
 @property (nonatomic, strong) UILabel * label4;
 @property (nonatomic, strong) UILabel * label5;
 @property (nonatomic, strong) UIImageView * statesListImage;
 */


- (void)addControl{
    _titleImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width / 2 - 111, 10, 222, 48)];
//    _titleImage.backgroundColor = [UIColor blackColor];
    _titleImage.image = [UIImage imageNamed:@"ztxx-3.png"];
    [self addSubview:_titleImage];
    
    _label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, self.frame.size.width / 5, 21)];
    _label1.text = @"待付款";
    [_label1 setFont:[UIFont fontWithName:nil size:14.0f]];
    _label1.textAlignment = 1;
    [self addSubview:_label1];
    
    _label2 = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width / 5, 70, self.frame.size.width / 5, 21)];
    _label2.text = @"待发货";
    _label2.textAlignment = 1;
    [_label2 setFont:[UIFont fontWithName:nil size:14.0f]];
    [self addSubview:_label2];
    
    _label3 = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width / 5 * 2, 70, self.frame.size.width / 5, 21)];
    _label3.text = @"配送中";
    _label3.textAlignment = 1;
    [_label3 setFont:[UIFont fontWithName:nil size:14.0f]];
    [self addSubview:_label3];
    
    _label4 = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width / 5 * 3, 70, self.frame.size.width / 5, 21)];
    _label4.text = @"已送达";
    _label4.textAlignment = 1;
    [_label4 setFont:[UIFont fontWithName:nil size:14.0f]];
    [self addSubview:_label4];
    
    _label5 = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width / 5 * 4, 70, self.frame.size.width / 5, 21)];
    _label5.text = @"已收货";
    _label5.textAlignment = 1;
    [_label5 setFont:[UIFont fontWithName:nil size:14.0f]];
    [self addSubview:_label5];
    
    _statesListImage = [[UIImageView alloc] initWithFrame:CGRectMake(25, 100, self.frame.size.width - 50, (self.frame.size.width - 30) * 99/2606)];
    _statesListImage.image = [UIImage imageNamed:@"zt-1.png"];
    [self addSubview:_statesListImage];
}

@end
