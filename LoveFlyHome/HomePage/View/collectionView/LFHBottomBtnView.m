//
//  BottomBtnView.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/3.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHBottomBtnView.h"
#import "Public.h"
#import "Masonry.h"
@implementation LFHBottomBtnView
- (instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        /**加入购物车按钮**/
        self.btn_shopCar=[UIButton buttonWithType:UIButtonTypeCustom];
        [self.btn_shopCar setBackgroundImage:[UIImage imageNamed:@"shopCare"] forState:0];
        [self addSubview:self.btn_shopCar];
        [self.btn_shopCar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).with.offset(0);
            make.right.mas_equalTo(self).with.offset(-screen_width/2-20);
            make.top.mas_equalTo(self).with.offset(0);
            make.bottom.mas_equalTo(self).with.offset(0);
        }];
        /**立即抢购**/
        self.btn_Rush=[UIButton buttonWithType:UIButtonTypeCustom];
        [self.btn_Rush setBackgroundImage:[UIImage imageNamed:@"redRush"] forState:0];
        [self addSubview:self.btn_Rush];
        [self.btn_Rush mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self).with.offset(0);
            make.top.mas_equalTo(self).with.offset(0);
            make.bottom.mas_equalTo(self).with.offset(0);
            make.left.mas_equalTo(self).with.offset(screen_width/2-20);
        }];
        
    
    }
    return self;


}

@end
