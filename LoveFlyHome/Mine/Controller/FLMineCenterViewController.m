//
//  FLMineCenterViewController.m
//  LoveFlyHome
//
//  Created by eclectic on 16/5/30.
//  Copyright © 2016年 ispoc. All rights reserved.
//

#import "FLMineCenterViewController.h"
#import "Masonry.h"
#import "Public.h"
#import "UIButton+Extension.h"
#import "MasonyUtil.h"
#import "LFHButton.h"
#import "UserDefaultsUtils.h"
#import "LFHLoginViewController.h"
#import "LFHOrderViewController.h"
#import "LFHAccountTableViewController.h"
#import "DBHelper.h"
#import "UserInfoTable.h"
#import "LFHUserInfoMation.h"
#import "LFHTopupCenter.h"
#import "ImagePickerManager.h"
#import "TheMemberCenterController.h"
#define CellFooterheight 70
@interface FLMineCenterViewController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate>
{
    DBHelper *_helper;
    UserInfoTable *_userInfo;
    NSInteger NowID;
    UIActionSheet *_myActionSheet;


}
@property(strong,nonatomic)UITableView *mineTabView;
@property(strong,nonatomic)UIButton *registeredBtn;
@property(strong,nonatomic)UIView *headView;

/**头像**/
@property(strong,nonatomic)UIButton *headerImgBtn;
/**等级**/
@property(strong,nonatomic) UILabel *creditlab;

/**名字**/
@property(strong,nonatomic)UILabel *nameLab;

@end

@implementation FLMineCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**实例化数据库**/
    _helper=[[DBHelper alloc] init];
    
    /**本地化**/
    NSUserDefaults *userDF=[NSUserDefaults standardUserDefaults];
    
    NowID=[[userDF objectForKey:@"UserID"] integerValue];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden=YES;
    
    self.headView=[UIView new];
    [self.view addSubview:self.headView];
    self.headView.frame=CGRectMake(0, 0, screen_width, screen_height/3);
    self.headView.backgroundColor=RGB(64, 186, 64);
    
    

    [self setupTab];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self addHeader];
//    if(BASE_USERINFO.isLogin)
//    {
//        [self addHeader];
// 
//    }else
//    {
//       [self setUpNOMineHead];
//    
//    }
//    
}


#pragma mark -个人没有登录时的状态中心头部
- (void)setUpNOMineHead
{
    /**
     *登录
     **/
    UIButton *loginBtn=[[UIButton alloc] init];
    
    loginBtn.layer.cornerRadius=10;
    [loginBtn setImage:[UIImage imageNamed:@"dl-01"] forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.headView addSubview:loginBtn];
    /**位置**/

    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headView).with.offset(screen_width/2-120);
        make.height.equalTo(@35);
        make.width.equalTo(@100);
        make.top.mas_equalTo(self.headView).with.offset(self.headView.frame.size.height/2);
        
    }];
    
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
    [self.registeredBtn setImage:[UIImage imageNamed:@"dl-02"] forState:UIControlStateNormal];
    self.registeredBtn.backgroundColor=[UIColor whiteColor];
    [self.registeredBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.headView addSubview:self.registeredBtn];
    /**注册的点击事件**/
    [self.registeredBtn addTarget:self action:@selector(registeredClick) forControlEvents:UIControlEventTouchUpInside];

    /**位置**/
    [self.registeredBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.headView).with.offset(-70);
        make.height.equalTo(@35);
        make.width.equalTo(@100);
        make.top.mas_equalTo(self.headView).with.offset(self.headView.frame.size.height/2);
 
    }];
    

}

#pragma mark --登录后的状态
- (void)addHeader
{
    self.headerImgBtn=[UIButton new];
    self.headerImgBtn.layer.cornerRadius=75.0;
    [self.headerImgBtn setImage:[UIImage imageNamed:@"unlogin_head_h"] forState:UIControlStateNormal];
    [self.headView addSubview:self.headerImgBtn];
    /**点击事件**/
    [self.headerImgBtn addTarget:self action:@selector(userDetailClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.headerImgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.headView).with.offset(-120);
        make.height.equalTo(@150);
        make.width.equalTo(@150);
        make.top.mas_equalTo(self.headView).with.offset(self.headView.frame.size.height/2-50);
    }];
    
    self.creditlab=[UILabel new];
    self.creditlab.text=@"😊";
    [self.headView addSubview:self.creditlab];
    
    [self.creditlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerImgBtn).with.offset(10);
        make.bottom.mas_equalTo(self.headView).with.offset(20);
        make.height.equalTo(@30);
        make.right.mas_equalTo(self.headView).with.offset(-120);
    }];
    
    self.nameLab=[UILabel new];
    self.nameLab.text=@"小明";
    self.nameLab.textColor=[UIColor whiteColor];
    [self.headView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerImgBtn).with.offset(90);
        make.bottom.mas_equalTo(self.headView).with.offset(-10);
        make.height.equalTo(@30);
        make.left.mas_equalTo(self.headView).with.offset(screen_width/2-25);
    }];


}


#pragma mark -登录事件
- (void)loginClick
{
    NSLog(@"登录");
    LFHLoginViewController *login=[[LFHLoginViewController alloc] init];
    [self.navigationController pushViewController:login animated:YES];
    

}

#pragma mark -注册
- (void)registeredClick
{
    NSLog(@"注册");
    LFHLoginViewController *login=[[LFHLoginViewController alloc] init];
    [self.navigationController pushViewController:login animated:YES];

}

#pragma mark --点击头像详情
- (void)userDetailClick
{
    NSLog(@"你点击了头像");
    _myActionSheet=[[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册选取", nil];
    [_myActionSheet showInView:self.view];
    
    



}

#pragma mark --<UIActionSheetDelegate>
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    /**
     *相册
     **/
    if(buttonIndex==1)
    {
        [[ImagePickerManager shareImagePickerManager] takePictureWithType:ImagePickerManagerTypePhotoLibrary
                                                               completion:^(BOOL success, id content) {
                                                                   if (success) {
                                                                       //                                                                       [self updateheadImage:content];
                                                                   }
                                                               }];
        
        
        
    } // 拍照
    else if (buttonIndex == 0) {
        [[ImagePickerManager shareImagePickerManager] takePictureWithType:ImagePickerManagerTypeCamera
                                                               completion:^(BOOL success, id content) {
                                                                   if (success) {
                                                                       //                                                                       [self updateheadImage:content];
                                                                   }
                                                               }];
    }
    
    
    
    
    
}

#pragma mark -创建表格
- (void)setupTab
{
    self.mineTabView=[[UITableView alloc] initWithFrame:CGRectMake(0, screen_height/3, screen_width, screen_height)];
    self.mineTabView.dataSource=self;
    self.mineTabView.delegate=self;
    /**设置分割线颜色**/
    [self.mineTabView setSeparatorColor:RGB(230, 230, 230)];
    [self.view addSubview:self.mineTabView];


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
        
            break;
            
        default:
            break;
    }


    return cell;


}

#pragma mark -cell点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"====我的订单");
    LFHOrderViewController *order=[[LFHOrderViewController alloc] init];
    [self.navigationController pushViewController:order animated:YES];
    


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
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width-10, 0.4));
        make.bottom.mas_equalTo(footer.mas_top);
    }];
    
    if (section==0) {
        
        UIButton *btn1 = [UIButton createButtonWithImage:@"图标-22.png" Title:@"待付款" Target:self Selector:@selector(OnClick:)];
        btn1.tag=1;
        [footer addSubview:btn1];
        
        UIButton *btn2 = [UIButton createButtonWithImage:@"图标-23.png" Title:@"待发货" Target:self Selector:@selector(OnClick:)];
        btn2.tag=2;
        [footer addSubview:btn2];
        
        UIButton *btn3 = [UIButton createButtonWithImage:@"待收货" Title:@"待收货" Target:self Selector:@selector(OnClick:)];
        btn3.tag=3;
        [footer addSubview:btn3];
        
        UIButton *btn4 = [UIButton createButtonWithImage:@"已送达" Title:@"已完成" Target:self Selector:@selector(OnClick:)];
        btn4.tag=4;
        [footer addSubview:btn4];
        
        [MasonyUtil equalSpacingView:@[btn1,btn2,btn3,btn4]
                           viewWidth:screen_width/4-10
                          viewHeight:CellFooterheight
                      superViewWidth:screen_width];
        return footer;
    }else if(section==1){
        LFHButton *btn11=[LFHButton new];
        [btn11 LFHButtonontentWithImage:@"图标-28.png" Title:@"会员中心" width: screen_width/4-10 height:CellFooterheight];
        [btn11 addTarget:self action:@selector(NumberCenterClick) forControlEvents:UIControlEventTouchUpInside];
        [footer addSubview:btn11];
        
        LFHButton *btn22=[LFHButton new];
        [btn22 LFHButtonontentWithImage:@"图标-29.png" Title:@"充值中心" width: screen_width/4-10 height:CellFooterheight];
        /**充值中心事件**/
        [btn22 addTarget:self action:@selector(TopupcenterClick) forControlEvents:UIControlEventTouchUpInside];
        
        [footer addSubview:btn22];
        
        LFHButton *btn33=[LFHButton new];
        [btn33 LFHButtonontentWithImage:@"图标-30.png" Title:@"设置" width: screen_width/4-10 height:CellFooterheight];
        /**设置事件***/
        [btn33 addTarget:self action:@selector(Setuptheclick) forControlEvents:UIControlEventTouchUpInside];
        
        [footer addSubview:btn33];
        LFHButton *btn44=[LFHButton new];
        [btn44 LFHButtonontentWithImage:@"" Title:@"" width: screen_width/4-10 height:CellFooterheight];
        
        [footer addSubview:btn44];
        

        [MasonyUtil equalSpacingView:@[btn11,btn22,btn33,btn44]
                           viewWidth:screen_width/4-10
                          viewHeight:CellFooterheight
                      superViewWidth:screen_width];
        return footer;
    }
    return nil;
}


#pragma mark --会员中心
- (void)NumberCenterClick
{
    NSLog(@"会员中心");
    TheMemberCenterController *MemberView=[[TheMemberCenterController alloc] init];
    [self.navigationController pushViewController:MemberView animated:YES];

}

#pragma mark --设置界面
- (void)Setuptheclick
{

    NSLog(@"进入设置界面");
    LFHAccountTableViewController *account=[[LFHAccountTableViewController alloc] init];
    [self.navigationController pushViewController:account animated:YES];

}

#pragma mark -点击进入充值中心界面
- (void)TopupcenterClick
{
    NSLog(@"进入充值界面");
    LFHTopupCenter *topupCenter=[[LFHTopupCenter alloc] init];
    [self.navigationController pushViewController:topupCenter animated:YES];


}

- (void)OnClick:(UIButton *)sender
{
    NSLog(@"====");
    LFHOrderViewController *order=[[LFHOrderViewController alloc] init];
    [self.navigationController pushViewController:order animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
