//
//  LFHPaytreasureOrWeChatpayViewControler.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/8.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHPaytreasureOrWeChatpayViewControler.h"
#import "Masonry.h"
#import "Public.h"
@interface LFHPaytreasureOrWeChatpayViewControler ()<UITableViewDataSource,UITableViewDelegate>
{
    BOOL isChecked;
    
    UITextField *banaceField;

}
@property(strong,nonatomic)UIView *navView;
@property(strong,nonatomic)UITableView *PayCenterView;
@property(strong,nonatomic)UIButton *checkButtonPayzhi;
@property(strong,nonatomic)UIButton *checkButtonWeiChat;
@end

@implementation LFHPaytreasureOrWeChatpayViewControler

- (void)viewDidLoad {
    [super viewDidLoad];
    isChecked=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    [self setNavgationView];
    [self setTableView];
    
    
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
    

}

#pragma mark --返回
- (void)backClick
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark --setTableView
- (void)setTableView
{
    self.PayCenterView=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, screen_width, screen_height)];
    self.PayCenterView.delegate=self;
    self.PayCenterView.dataSource=self;
    /**设置分割线**/
    [self.PayCenterView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [self.PayCenterView setSeparatorColor:RGB(235, 235, 235)];
    [self.view addSubview:self.PayCenterView];

}

#pragma mark --datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==2)
    {
        return 2;
    }

    return 1;
}

#pragma mark --脚部
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section==0)
    {
        return 5;
    }else if (section==1)
    {
    
        return 30;
    }else if(section==2)
    {
        return 5;
    
    }else
    {
        return 1;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView=[[UIView alloc] init];
    footerView.backgroundColor=RGB(235, 235, 235);
    if(section==0)
    {
        footerView.frame=CGRectMake(0, 0, screen_width, 5);
        
    
    }else if (section==1)
    {
        
        footerView.frame=CGRectMake(0, 0, screen_width, 30);
        UILabel *footerLab=[[UILabel alloc] initWithFrame:CGRectMake(10, 5, 100, 25)];
        footerLab.font=[UIFont systemFontOfSize:12];
        footerLab.text=@"请选择支付方式";
        [footerView addSubview:footerLab];
    
    }else if (section==2)
    {
    
        footerView.frame=CGRectMake(0, 0, screen_width, 5);
    }else
    {
    
        footerView.frame=CGRectMake(0, 0, screen_width, 1);
        
    }
    return footerView;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        return screen_height/3-50;
    
    }else
    {
        return 60;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        static NSString *acell=@"acell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:acell];
        if(!cell)
        {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:acell];
        }
        UIImageView *topView=[UIImageView new];
        topView.image=[UIImage imageNamed:@"handAndPig"];
        [cell addSubview:topView];
        [topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(cell).with.offset(0);
            make.left.mas_equalTo(cell).with.offset(100);
            make.right.mas_equalTo(cell).with.offset(-100);
            make.bottom.mas_equalTo(cell).with.offset(0);
            
        }];
        return cell;
    
    
    }else if (indexPath.section==1)
    {
        static NSString *acell2=@"cell2";
        UITableViewCell *Cell2=[tableView dequeueReusableCellWithIdentifier:acell2];
        if(!Cell2)
        {
            Cell2=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:acell2];
        
        }
        
        Cell2.textLabel.text=@"充值金额（¥）";
       banaceField=[UITextField new];
        banaceField.placeholder=@"请填写金额";
        [Cell2 addSubview:banaceField];
        [banaceField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(Cell2).with.offset(-10);
            make.bottom.mas_equalTo(Cell2).with.offset(-5);
            make.top.mas_equalTo(Cell2).with.offset(5);
            make.left.mas_equalTo(Cell2).with.offset(150);
        }];
        
        return Cell2;
    }else if (indexPath.section==2)
    {
        if(indexPath.row==0)
        {
            static NSString *payzhi=@"zhiPay";
            UITableViewCell *zhiPayCell=[tableView dequeueReusableCellWithIdentifier:payzhi];
            if(!zhiPayCell)
            {
            
                zhiPayCell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:payzhi];
            
            }
            UIImageView *zhiImage=[UIImageView new];
            zhiImage.image=[UIImage imageNamed:@"zhiPay"];
            [zhiPayCell addSubview:zhiImage];
            [zhiImage mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(zhiPayCell).with.offset(10);
                make.top.mas_equalTo(zhiPayCell).with.offset(15);
                make.height.mas_equalTo(35);
                make.width.mas_equalTo(35);
            }];
            
            UILabel *zhiPayLab=[UILabel new];
            zhiPayLab.text=@"支付宝支付";
            zhiPayLab.font=[UIFont systemFontOfSize:15];
            [zhiPayCell addSubview:zhiPayLab];
            [zhiPayLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(zhiImage).with.offset(45);
                make.top.mas_equalTo(zhiPayCell).with.offset(0);
                make.height.mas_equalTo(30);
                make.width.mas_equalTo(100);
            }];
            
            UILabel *recommendedlab=[UILabel new];
            recommendedlab.text=@"推荐已安装支付宝客户端的用户使用";
            recommendedlab.textColor=RGB(115, 115, 116);
            recommendedlab.font=[UIFont systemFontOfSize:13];
            [zhiPayCell addSubview:recommendedlab];
            [recommendedlab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(zhiImage).with.offset(45);
                make.bottom.mas_equalTo(zhiPayCell).with.offset(-5);
                make.height.mas_equalTo(30);
                make.width.mas_equalTo(220);
            }];
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            
            if (isChecked) {
                
                
                 [button setImage:[UIImage imageNamed:@"Nocheck"] forState:UIControlStateNormal];
                
            } else {
                
                 [button setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
            }
           
            
            [zhiPayCell addSubview:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(zhiPayCell).with.offset(-10);
                make.bottom.mas_equalTo(zhiPayCell).with.offset(-20);
                make.width.mas_equalTo(20);
                make.height.mas_equalTo(20);
            }];
            
            /**选择事件**/
            [button addTarget:self action:@selector(isBoolSelected) forControlEvents:UIControlEventTouchUpInside];
            return zhiPayCell;
        
        
        }else
        {
        
            static NSString *weiChat=@"weiChat";
            UITableViewCell *weiChatCell=[tableView dequeueReusableCellWithIdentifier:weiChat];
            if(!weiChatCell)
            {
                
                weiChatCell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:weiChat];
                
            }
            UIImageView *weichatImage=[UIImageView new];
            weichatImage.image=[UIImage imageNamed:@"weiChat"];
            [weiChatCell addSubview:weichatImage];
            [weichatImage mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(weiChatCell).with.offset(10);
                make.top.mas_equalTo(weiChatCell).with.offset(15);
                make.height.mas_equalTo(35);
                make.width.mas_equalTo(35);
            }];
            
            UILabel *weichatPayLab=[UILabel new];
            weichatPayLab.text=@"微信支付";
            weichatPayLab.font=[UIFont systemFontOfSize:15];
            [weiChatCell addSubview:weichatPayLab];
            [weichatPayLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(weichatImage).with.offset(45);
                make.top.mas_equalTo(weiChatCell).with.offset(0);
                make.height.mas_equalTo(30);
                make.width.mas_equalTo(100);
            }];
            
            UILabel *recommendedlab=[UILabel new];
            recommendedlab.text=@"推荐已安装微信客户端的用户使用";
            recommendedlab.textColor=RGB(115, 115, 116);
            recommendedlab.font=[UIFont systemFontOfSize:13];
            [weiChatCell addSubview:recommendedlab];
            [recommendedlab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(weichatImage).with.offset(45);
                make.bottom.mas_equalTo(weiChatCell).with.offset(-5);
                make.height.mas_equalTo(30);
                make.width.mas_equalTo(200);
            }];
            self.checkButtonWeiChat=[UIButton buttonWithType:UIButtonTypeCustom];
            [self.checkButtonWeiChat setImage:[UIImage imageNamed:@"Nocheck"] forState:UIControlStateNormal];
            [weiChatCell addSubview:self.checkButtonWeiChat];
            [self.checkButtonWeiChat mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(weiChatCell).with.offset(-10);
                make.bottom.mas_equalTo(weiChatCell).with.offset(-20);
                make.width.mas_equalTo(20);
                make.height.mas_equalTo(20);
            }];
            
            /**选择事件**/
            [self.checkButtonWeiChat addTarget:self action:@selector(isBoolSelectedweichat) forControlEvents:UIControlEventTouchUpInside];

            return weiChatCell;
        }
    
    }

    else
    {
    
        static NSString *acell1=@"acell";
        UITableViewCell *cell1=[tableView dequeueReusableCellWithIdentifier:acell1];
        if(!cell1)
        {
            cell1=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:acell1];
        }
        UIButton *sureBtn=[UIButton new];
        sureBtn.layer.cornerRadius=10;
        sureBtn.backgroundColor=RGB(64, 186, 64);
        [sureBtn setTitle:@"确认充值" forState:UIControlStateNormal];
        [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [cell1 addSubview:sureBtn];
        [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(cell1).with.offset(10);
            make.top.mas_equalTo(cell1).with.offset(10);
            make.bottom.mas_equalTo(cell1).with.offset(-10);
            make.right.mas_equalTo(cell1).with.offset(-10);
        }];
        [sureBtn addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
        return cell1;
    
    }


}

- (BOOL)textFieldShouldReturn:(UITextField *)textField

{
    
    [banaceField resignFirstResponder];
    
    return YES;
    
}
#pragma mark --选择事件
- (void)isBoolSelected
{
    isChecked = NO;
    [self.PayCenterView reloadData];
    

}
- (void)isBoolSelectedweichat
{
    isChecked = YES;
    [self.PayCenterView reloadData];
    


}
#pragma mark --确认充值事件
- (void)sureClick
{

    if (isChecked) {
        NSLog(@"微信");
        
        
        

    } else {
        NSLog(@"支付宝");

    }
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
