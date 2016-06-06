//
//  BuyPushView.h
//  LoveFlyHome
//
//  Created by gpf on 16/5/30.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuyPushView : UIView <UITextFieldDelegate>
@property (nonatomic, strong) UIButton * touchButton;
@property (nonatomic, strong) UIImageView * goodsImage;
@property (nonatomic, strong) UILabel * priceLabel;
@property (nonatomic, strong) UILabel * storeLabel;
@property (nonatomic, strong) UILabel * haveSelect;
@property (nonatomic, strong) UILabel * geugeLabel;
@property (nonatomic, strong) UITextField * buyNumField;
@property (nonatomic, strong) UILabel * numLabel;
@property (nonatomic, strong) UIButton * addButton;
@property (nonatomic, strong) UIButton * reduceButton;
@property (nonatomic, strong) UIButton * dismissButton;
@property (nonatomic, strong) UIButton * sureButton;
@property (nonatomic, strong) UIView * backGroundView;
@property (nonatomic, assign) int goodsNum;
@property (nonatomic, assign) int goodsID;
@property (nonatomic,strong)UILabel *goodsName;

+ (instancetype)getPushBuyViewWithView:(UIView *)view;




@end
