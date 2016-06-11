//
//  TheMemberCenterController.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/7.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "TheMemberCenterController.h"
#import "Public.h"
#import "Masonry.h"
@interface TheMemberCenterController ()
@property(strong,nonatomic)UIImageView *bgImageView;
@end

@implementation TheMemberCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor=[UIColor whiteColor];
    [self setNav];
    [self setSomeLab];
    
}

#pragma mark --背景
- (void)setNav
{
    self.bgImageView=[UIImageView new];
    self.bgImageView.userInteractionEnabled=YES;
    self.bgImageView.image=[UIImage imageNamed:@"hy-6"];
    [self.view addSubview:self.bgImageView];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).with.offset(0);
        make.top.mas_equalTo(self.view).with.offset(0);
        make.right.mas_equalTo(self.view).with.offset(0);
        make.height.mas_equalTo(screen_height/3+50);
    }];
    
    UIButton *backBtn=[UIButton new];
    [backBtn setImage:[UIImage imageNamed:@"navigation_bar_back"] forState:UIControlStateNormal];
    
    [self.bgImageView addSubview:backBtn];
    
    [backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bgImageView).with.offset(10);
        make.top.mas_equalTo(self.bgImageView).with.offset(35);
        make.width.mas_equalTo(13);
        make.height.mas_equalTo(15);
    }];
    
    UILabel *centerLab=[UILabel new];
    centerLab.text=@"会员中心";
    centerLab.font=[UIFont boldSystemFontOfSize:15];
    centerLab.textColor=[UIColor whiteColor];
    [self.bgImageView addSubview:centerLab];
    [centerLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bgImageView).with.offset(screen_width/2-30);
        make.top.mas_equalTo(30);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    /**头像**/
    UIImageView *headImg=[[UIImageView alloc] init];
    headImg.layer.borderWidth=1.0;
    headImg.layer.borderColor=[UIColor grayColor].CGColor;
    headImg.image=[UIImage imageNamed:@"touxiang.jpg"];
    headImg.layer.cornerRadius=30;
    [self.bgImageView addSubview:headImg];
    [headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bgImageView).with.offset(screen_width/2-30);
        make.top.mas_equalTo(centerLab).with.offset(40);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(60);
    }];
    
    /**账户名**/
    UILabel *nameLab=[UILabel new];
    nameLab.text=@"李明";
    nameLab.textColor=[UIColor whiteColor];
    [self.bgImageView addSubview:nameLab];
    [nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bgImageView).with.offset(screen_width/2-10);
        make.top.mas_equalTo(headImg).with.offset(70);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(30);
    }];
    
    /**等级**/
    UIImageView *levelImage=[UIImageView new];
    [levelImage setImage:[UIImage imageNamed:@"level3"]];
    
    [self.bgImageView addSubview:levelImage];
    [levelImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(nameLab).with.offset(60);
        make.top.mas_equalTo(headImg).with.offset(70);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(15);
    }];
    
    /***进度条**/
    
    /**分值比**/
    /**百分值**/
    UILabel *percentagelab=[UILabel new];
    percentagelab.text=@"/100";
    percentagelab.textColor=[UIColor whiteColor];
    [self.bgImageView addSubview:percentagelab];
    
    
    
    
    UILabel *scoreLab1=[UILabel new];
    [self.bgImageView addSubview:scoreLab1];
    scoreLab1.text=@"8";
    scoreLab1.textColor=RGB(248, 247, 0);
    
    
    
    UIImageView *progressImg=[UIImageView new];
    progressImg.image=[UIImage imageNamed:@"progress1"];
    [self.bgImageView addSubview:progressImg];
    [progressImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bgImageView).with.offset(10);
        make.right.mas_equalTo(self.bgImageView).with.offset(-10);
        make.top.mas_equalTo(nameLab).with.offset(35);;
        make.height.mas_equalTo(50);
    }];
    
    
    
    

}

- (void)setSomeLab
{
    UILabel *privilegeLab=[UILabel new];
    privilegeLab.text=@"特权功能";
    privilegeLab.font=[UIFont boldSystemFontOfSize:18];
    [self.view addSubview:privilegeLab];
    [privilegeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).with.offset(10);
        make.top.mas_equalTo(self.bgImageView).with.offset(screen_height/3+100);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    
    UITextView *textView=[UITextView new];
    textView.layer.borderWidth=1.0;
    textView.layer.borderColor=RGB(235, 235, 235).CGColor;
    textView.text=@"会员卡充值有赠送，充200送20，充500送60，并可参加公司组织的基地半日游活动，另基地只对会员开放。";
    textView.textColor=RGB(124, 124, 124);
    [self.view addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).with.offset(10);
        make.top.mas_equalTo(privilegeLab).with.offset(35);
        make.right.mas_equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(200);
    }];


}


#pragma mark --返回
-(void)backClick
{
    NSLog(@"返回");
    [self.navigationController popViewControllerAnimated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
