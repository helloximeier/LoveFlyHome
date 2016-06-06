//
//  BuyPushView.m
//  LoveFlyHome
//
//  Created by gpf on 16/5/30.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "BuyPushView.h"
#import "Header.h"
#import "Public.h"
#import "DBHelper.h"
@interface BuyPushView()
{
    DBHelper *_dbHelper;

}
@end
@implementation BuyPushView



+ (instancetype)getPushBuyViewWithView:(UIView *)view
{
  
    BuyPushView * buyView = [BuyPushView new];
    buyView.frame = CGRectMake(0, view.frame.size.height * 2 / 3, view.frame.size.width, view.frame.size.height * 2 / 3);
    buyView.backgroundColor = [UIColor whiteColor];
    [buyView addDetailControl];
    return buyView;
}

/*
 
 @property (nonatomic, strong) UIImage * goodsImage;
 @property (nonatomic, strong) UILabel * priceLabel;
 @property (nonatomic, strong) UILabel * storeLabel;
 @property (nonatomic, strong) UILabel * -;
 @property (nonatomic, strong) UILabel * geugeLabel;
 @property (nonatomic, strong) UILabel * buyNumLabel;
 @property (nonatomic, strong) UILabel * numLabel;
 @property (nonatomic, strong) UIButton * addButton;
 @property (nonatomic, strong) UIButton * reduceButton;
 */

- (void)addControl
{
    _goodsNum = 1;
//    _touchButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_touchButton setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height / 3)];
//    [self addSubview:_touchButton];
    
//    _backGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height / 3, self.frame.size.width, self.frame.size.height / 2 * 3)];
//    _backGroundView.backgroundColor = [UIColor whiteColor];
//    _backGroundView.alpha = 1.0;
//    [self addSubview:_backGroundView];
//    [self addDetailControl];
    
    
}

- (void)addDetailControl
{
    /**显示图片**/
    _goodsImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 5, 80, 80)];
    [_goodsImage.layer setMasksToBounds:YES];
    [_goodsImage.layer setCornerRadius:10.0];//设置矩形四个圆角半径
    _goodsImage.backgroundColor = [UIColor redColor];
    [self addSubview:_goodsImage];
    
    /**价格标签**/
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 5, 120, 30)];

    _priceLabel.text = @"￥15.00";
    [_priceLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18.0f]];
    [self addSubview:_priceLabel];
    
    /**库存数量**/

    _storeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, 120, 30)];

    _storeLabel.text = @"剩余:1000件";
    [_storeLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14.0f]];
    [self addSubview:_storeLabel];
    
    /**购买标准**/
    UILabel *goumaibiaozhun=[[UILabel alloc] initWithFrame:CGRectMake(15, 90, 50, 30)];
    goumaibiaozhun.text=@"规格:";
    [self addSubview:goumaibiaozhun];
    _haveSelect = [[UILabel alloc] initWithFrame:CGRectMake(70, 90, 120, 30)];
    _haveSelect.text = @"1Kg";
    [self addSubview:_haveSelect];
    
    UIImageView * lineView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 120, self.frame.size.width, 1)];
    lineView.backgroundColor = [UIColor lineViewColor];
    [self addSubview:lineView];
    
    //购买规格
    _geugeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 125, 120, 50)];
    _geugeLabel.text = @"购买数量";
    [self addSubview:_geugeLabel];
    
    _reduceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_reduceButton setFrame:CGRectMake(self.frame.size.width - 101, 140, 20, 20)];
    [_reduceButton setBackgroundImage:[UIImage imageNamed:@"tianjiagoods.png"] forState:UIControlStateNormal];
    [self addSubview:_reduceButton];
    
    _buyNumField = [[UITextField alloc] initWithFrame:CGRectMake(self.frame.size.width - 91 + 13, 135, 40, 30)];
      _buyNumField.textAlignment =NSTextAlignmentCenter;
    _buyNumField.delegate = self;
     _buyNumField.placeholder = @"1";
    [self addSubview:_buyNumField];
    
    _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addButton setFrame:CGRectMake(self.frame.size.width - 33, 140, 20, 20)];
    [_addButton setBackgroundImage:[UIImage imageNamed:@"jianshaogoods.png"] forState:UIControlStateNormal];
    [self addSubview:_addButton];
    
    
    UIImageView * lineView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 175, self.frame.size.width, 1)];
    lineView1.backgroundColor = [UIColor lineViewColor];
    [self addSubview:lineView1];
    
    
    _dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_dismissButton setFrame:CGRectMake(self.frame.size.width - 33, 10, 18, 18)];
    [_dismissButton setBackgroundImage:[UIImage imageNamed:@"图标-17.png"] forState:UIControlStateNormal];
    [self addSubview:_dismissButton];
    
    
    _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sureButton setFrame:CGRectMake(0, self.frame.size.height - 44, self.frame.size.width, 50)];
    [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
    _sureButton.backgroundColor = RGB(64, 186, 64);
    [self addSubview:_sureButton];
    
    /**确定按钮事件*/
    [_sureButton addTarget:self action:@selector(addSureButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark --确定按钮事件
- (void)addSureButtonClick
{
    /**
     *实例化数据库帮助类
     **/
    _dbHelper=[[DBHelper alloc] init];
    
    NSString *sql=[NSString stringWithFormat:@"insert into GoodsInfoTable(GoodsImage,GoodsPrice,GoodsWeight,GoodsNums) values('%@','%@','%@','%@')",_goodsImage,_priceLabel.text,_haveSelect.text,_buyNumField.text];
    NSLog(@"-------------%@",sql);
    if([_dbHelper exceSql:sql])
    {
        NSLog(@"添加到购物车成功");
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"添加到购物车成功" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];

    }else
    {
    
        NSLog(@"失败");
    }
    
    NSLog(@"=====");

}

@end
