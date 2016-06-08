//
//  LFHTopupCenter.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/8.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHTopupCenter.h"
#import "Masonry.h"
#import "Public.h"
#import "LFHPaytreasureOrWeChatpayViewControler.h"
@interface LFHTopupCenter ()
@property(strong,nonatomic) UIView *navView;
@end

@implementation LFHTopupCenter

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self setNavgationView];
    
    [self setTopUpCenter];
    
}

#pragma mark --设置导航栏
- (void)setNavgationView
{
   self.navView=[UIView new];
    self.navView.backgroundColor=RGB(64, 186, 64);
    [self.view addSubview:self.navView];
    [self.navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).with.offset(0);
        make.top.mas_equalTo(self.view).with.offset(0);
        make.right.mas_equalTo(self.view).with.offset(0);
        make.height.equalTo(@64);
        
    }];
    
    UIButton *backButton=[UIButton new];
    [backButton setImage:[UIImage imageNamed:@"navigation_bar_back"] forState:UIControlStateNormal];
    backButton.tintColor=[UIColor whiteColor];
    /**返回事件**/
    [backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:backButton];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.navView).with.offset(10);
        make.top.mas_equalTo(self.navView).with.offset(30);
        make.bottom.mas_equalTo(self.navView).with.offset(-10);
        make.width.equalTo(@20);
    }];
    
    UIButton *DetailBtn=[UIButton new];
    [DetailBtn setTitle:@"明细" forState:UIControlStateNormal];
    DetailBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [DetailBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.navView addSubview:DetailBtn];
    [DetailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.navView).with.offset(-5);
        make.bottom.mas_equalTo(self.navView).with.offset(-5);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(30);
    }];
    [DetailBtn addTarget:self action:@selector(DetailClick) forControlEvents:UIControlEventTouchUpInside];


}

#pragma mark --返回
- (void)backClick
{

    [self.navigationController popViewControllerAnimated:YES];

}

#pragma mark --明细
- (void)DetailClick
{
    NSLog(@"明细");


}

#pragma mark --界面充值中心
- (void)setTopUpCenter
{
    UIImageView *topImageView=[UIImageView new];
    topImageView.image=[UIImage imageNamed:@"pigCenter"];
    [self.view addSubview:topImageView];
    
    [topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.navView).with.offset(80);
        make.left.mas_equalTo(self.view).with.offset(100);
        make.right.mas_equalTo(self.view).with.offset(-100);
        make.height.mas_equalTo(screen_height/2-180);
    }];
    
    /**当前余额**/
    
    UILabel * currentBalance=[UILabel new];
    currentBalance.text=@"当前余额";
    [self.view addSubview:currentBalance];
    [currentBalance mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topImageView).with.offset(150);
        make.left.mas_equalTo(self.view).with.offset(130);
        make.right.mas_equalTo(self.view).with.offset(-100);
        make.height.mas_equalTo(30);
    }];
    
    UILabel *moneyLab=[UILabel new];
    moneyLab.text=@"¥230";
    moneyLab.font=[UIFont boldSystemFontOfSize:22];
    [self.view addSubview:moneyLab];
    [moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentBalance).with.offset(30);
        make.left.mas_equalTo(self.view).with.offset(135);
        make.right.mas_equalTo(self.view).with.offset(-100);
        make.height.mas_equalTo(30);

    }];
    
    
    UIButton * TopUpBtn=[UIButton new];
    [TopUpBtn setImage:[UIImage imageNamed:@"cz-01"] forState:UIControlStateNormal];
    [self.view addSubview:TopUpBtn];
    [TopUpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).with.offset(15);
        make.right.mas_equalTo(self.view).with.offset(-15);
        make.top.mas_equalTo(moneyLab).with.offset(50);
        make.height.mas_equalTo(50);
    }];
    [TopUpBtn addTarget:self action:@selector(topUpCenterClick) forControlEvents:UIControlEventTouchUpInside];

}

#pragma mark --充值事件
- (void)topUpCenterClick
{
    
    LFHPaytreasureOrWeChatpayViewControler *payView=[[LFHPaytreasureOrWeChatpayViewControler alloc] init];
    [self.navigationController pushViewController:payView animated:YES];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
