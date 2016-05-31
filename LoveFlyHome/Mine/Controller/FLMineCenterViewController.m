//
//  FLMineCenterViewController.m
//  LoveFlyHome
//
//  Created by eclectic on 16/5/30.
//  Copyright © 2016年 ispoc. All rights reserved.
//

#import "FLMineCenterViewController.h"
#import <Masonry.h>
#import "Public.h"
#import "LFHRippleButton.h"
#import "UIButton+Extension.h"
#import "MasonyUtil.h"
#import "LFHButton.h"
#define CellFooterheight 80
@interface FLMineCenterViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic)UITableView *mineTabView;
@property(strong,nonatomic)UIButton *registeredBtn;
@end

@implementation FLMineCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpMineHead];
//    [self setUpMineHead];
    [self setupTab];
    
}


#pragma mark -个人中心头部
- (void)setUpMineHead
{
    self.navigationController.navigationBar.hidden=YES;
    UIView *headView=[UIView new];
    headView.frame=CGRectMake(0, 0, screen_width, screen_height/3);
//    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(self.view).with.offset(0.3f);
//
//        make.width.equalTo(self.view.mas_width);
//    }];
    headView.backgroundColor=RGB(64, 186, 64);
    [self.view addSubview:headView];
    
    /**
     *登录
     **/
    UIButton *loginBtn=[[UIButton alloc] init];
    
    loginBtn.layer.cornerRadius=10;
    loginBtn.layer.borderColor=[UIColor grayColor].CGColor;
    loginBtn.layer.borderWidth=1.0;
    loginBtn.backgroundColor=RGB(141, 201, 0);
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    /**位置**/
    /**设置间距为10***/
//    int padding=135;
//    int padding1=10;
    loginBtn.frame=CGRectMake(screen_width/2-110, screen_height/10+20, screen_width/4+10, screen_height/14);
//    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(headView.mas_centerY);
//        make.left.equalTo(headView.mas_left).with.offset(padding);
//        make.height.mas_equalTo(@35);
//        make.right.equalTo(self.registeredBtn.mas_left).with.offset(-padding1);
//        make.width.equalTo(self.registeredBtn);
//        
//    }];
    
    
    
    [headView addSubview:loginBtn];
    /**
     *登录事件
     **/
    [loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    
    /**
     *注册
     **/
    self.registeredBtn=[[UIButton alloc] init];
    self.registeredBtn.layer.borderWidth=1.0;
    self.registeredBtn.layer.borderColor=[UIColor grayColor].CGColor;
    self.registeredBtn.layer.cornerRadius=10.0;
    [self.registeredBtn setTitle:@"注册" forState:UIControlStateNormal];
    self.registeredBtn.backgroundColor=[UIColor whiteColor];
    [self.registeredBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.registeredBtn.frame=CGRectMake(screen_width/2, screen_height/10+20, screen_width/4+10, screen_height/14);
    /**位置**/
//    [self.registeredBtn mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.centerY.mas_equalTo(headView.mas_centerY);
////        make.left.equalTo(loginBtn.mas_right).with.offset(padding1);
////        make.right.equalTo(headView.mas_right).with.offset(-padding);
//        make.height.mas_equalTo(@35);
//        make.width.equalTo(loginBtn);
//    }];
    [headView addSubview:self.registeredBtn];
    
    



}
#pragma mark -登录事件
- (void)loginClick
{
    NSLog(@"登录");

}

#pragma mark -创建表格
- (void)setupTab
{
    self.mineTabView=[[UITableView alloc] initWithFrame:CGRectMake(0, screen_height/3, screen_width, screen_height)];
    self.mineTabView.dataSource=self;
    self.mineTabView.delegate=self;
    //    设置分割线颜色
    [self.mineTabView setSeparatorColor:RGB(230, 230, 230)];
    [self.view addSubview:self.mineTabView];


}

/**
 *无登录时状态
 */
- (UIImageView *)addNoHeaderBar
{
    UIImageView *header=[[UIImageView alloc] init];
    [header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@200);
        make.left.equalTo(self.view).with.offset(0);
        make.right.equalTo(self.view).with.offset(0);
    }];
    /**是否允许用户交互**/
    header.userInteractionEnabled=YES;
    header.backgroundColor=RGB(64, 185, 64);
    
    /**
     *未登录按钮光圈
     **/
    LFHRippleButton *unLoginBtnBg = [[LFHRippleButton alloc]
                                     initWithImage:[UIImage imageNamed:@"unlogin_head_n"]
                                     andFrame:CGRectMake(screen_width/2-90/2, 20, 90, 90)
                                     onCompletion:^(BOOL success) {
                                         
//                                         [self showLoginView];
                                         
                                     }];
    [unLoginBtnBg setRippleEffectEnabled:NO];
    [header addSubview:unLoginBtnBg];
    //头部卡片
    UIImageView *bgView = [UIImageView new];
    bgView.image=[UIImage imageNamed:@"head_extra_bg"];
    [header addSubview:bgView];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width, 50));
        make.bottom.mas_equalTo(header.mas_bottom);
    }];
    
    /**
     *账户名
     */
    UILabel *nameLable=[UILabel new];
    nameLable.text=@"用户名";
    [header addSubview:nameLable];
    [nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width, 30));
        make.bottom.mas_equalTo(header).with.offset(50);
    }];
    
    return header;

}

#pragma mark -登录状态
- (UIImageView *)addHeaderBar
{
    UIImageView *header=[[UIImageView alloc] init];
    [header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@200);
        make.left.equalTo(self.view).with.offset(0);
        make.right.equalTo(self.view).with.offset(0);
    }];
    /**是否允许用户交互**/
    header.userInteractionEnabled=YES;
    header.backgroundColor=RGB(64, 185, 64);
    
    /**
     *未登录按钮光圈
     **/
    LFHRippleButton *LoginBtnBg = [[LFHRippleButton alloc]
                                     initWithImage:[UIImage imageNamed:@"unlogin_head_n"]
                                     andFrame:CGRectMake(screen_width/2-90/2, 20, 90, 90)
                                     onCompletion:^(BOOL success) {
                                         
                                         //                                         [self showLoginView];
                                         
                                     }];
    [LoginBtnBg setRippleEffectEnabled:NO];
    [header addSubview:LoginBtnBg];
    /**
     *账户名
     */
    UILabel *nameLable=[UILabel new];
    nameLable.text=@"用户名";
    [header addSubview:nameLable];
    [nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width, 30));
        make.bottom.mas_equalTo(header).with.offset(50);
    }];
//    userName.text=_myInfo.userName;
    [header addSubview:nameLable];

    return header;


}
#pragma mark 设置分组标题内容高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if(section==0)
    {
        return 1;
    }else
    {
        return 10;
    }

}

#pragma mark 设置尾部说明内容高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    switch (section) {
        case 0:  return CellFooterheight;
        case 1:  return CellFooterheight;
        default: return 1;
    }
}

#pragma mark 设置每行高度（每行高度可以不一样）
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0)
    {
        return 30;
    }
    return 0;
}

#pragma mark 返回分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
//    if ([UserDefaultsUtils getOwnID] == 0) {
//        return 4;
//    }
    return 2;
}

#pragma mark 返回每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


#pragma mark -返回每行的单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"UITableViewCellIdentifierKey";
    
    //首先根据标示去缓存池取
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text=@"我的订单";
            /**右侧标识图*/
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
            ;
            cell.tintColor=[UIColor blackColor];
            break;
            
        default:
            break;
    }


    return cell;


}

#pragma mark 返回table头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section==0)
    {
        return 0;
    }else
    {
        UIView * view =[[UIView alloc]init];
        view.backgroundColor = RGB(235, 235, 235);
        return view;
        
    }
   
}

#pragma mark 返回table尾
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footer=[UIView new];
    footer.backgroundColor=[UIColor whiteColor];
    UIImageView *bgView = [UIImageView new];
    bgView.image=[UIImage imageNamed:@"MyAddressManager_line_new"];
    [footer addSubview:bgView];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width, 0.4));
        make.bottom.mas_equalTo(footer.mas_top);
    }];
    
    if (section==0) {
        
        UIButton *btn1 = [UIButton createButtonWithImage:@"图标-22.png" Title:@"待付款" Target:self Selector:@selector(OnClick:)];
        btn1.tag=1;
        [footer addSubview:btn1];
        
        UIButton *btn2 = [UIButton createButtonWithImage:@"图标-23.png" Title:@"待发货" Target:self Selector:@selector(OnClick:)];
        btn2.tag=2;
        [footer addSubview:btn2];
        
        UIButton *btn3 = [UIButton createButtonWithImage:@"图标-24.png" Title:@"待收货" Target:self Selector:@selector(OnClick:)];
        btn3.tag=3;
        [footer addSubview:btn3];
        
        UIButton *btn4 = [UIButton createButtonWithImage:@"图标-25.png" Title:@"已完成" Target:self Selector:@selector(OnClick:)];
        btn4.tag=4;
        [footer addSubview:btn4];
        
        [MasonyUtil equalSpacingView:@[btn1,btn2,btn3,btn4]
                           viewWidth:screen_width/4
                          viewHeight:CellFooterheight
                      superViewWidth:screen_width];
        return footer;
    }else if(section==1){
        LFHButton *btn11=[LFHButton new];
        [btn11 LFHButtonontentWithImage:@"图标-28.png" Title:@"会员中心" width: screen_width/4 height:CellFooterheight];
        
        [footer addSubview:btn11];
        
        LFHButton *btn22=[LFHButton new];
        [btn22 LFHButtonontentWithImage:@"图标-29.png" Title:@"充值中心" width: screen_width/4 height:CellFooterheight];
        
        [footer addSubview:btn22];
        
        LFHButton *btn33=[LFHButton new];
        [btn33 LFHButtonontentWithImage:@"图标-30.png" Title:@"设置" width: screen_width/4 height:CellFooterheight];
        
        [footer addSubview:btn33];
        LFHButton *btn44=[LFHButton new];
        [btn44 LFHButtonontentWithImage:@"" Title:@"" width: screen_width/4 height:CellFooterheight];
        
        [footer addSubview:btn44];
        

        [MasonyUtil equalSpacingView:@[btn11,btn22,btn33,btn44]
                           viewWidth:screen_width/4
                          viewHeight:CellFooterheight
                      superViewWidth:screen_width];
        return footer;
    }
    return nil;
}

- (void)OnClick:(UIButton *)sender
{
    NSLog(@"====");

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
