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
#import "PayWayTableViewCell.h"

@interface LFHPaytreasureOrWeChatpayViewControler ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    BOOL isChecked;
    
    

}
@property(strong,nonatomic)UIView *navView;
@property(strong,nonatomic)UITableView *PayCenterView;
@property(strong,nonatomic)UIButton *checkButtonPayzhi;
@property(strong,nonatomic)UIButton *checkButtonWeiChat;
@property(strong,nonatomic)UITextField *banaceField;
@end

@implementation LFHPaytreasureOrWeChatpayViewControler

- (void)viewDidLoad {
    [super viewDidLoad];
    isChecked=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    [self setNavgationView];
    [self setTableView];
    /**实现textfiled的代理**/
    self.banaceField.delegate=self;
    
    
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
        make.bottom.mas_equalTo(self.navView).with.offset(-10);
        make.width.equalTo(@13);
        make.height.mas_equalTo(15);
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
    _PayCenterView=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, screen_width, screen_height)];
    self.PayCenterView.delegate=self;
    self.PayCenterView.dataSource=self;
    /**设置分割线**/
//    [self.PayCenterView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
//    [self.PayCenterView setSeparatorColor:RGB(235, 235, 235)];
    [self.view addSubview:_PayCenterView];

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
        self.banaceField=[UITextField new];
        self.banaceField.placeholder=@"请填写金额";
        [Cell2 addSubview:self.banaceField];
        [self.banaceField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(Cell2).with.offset(-10);
            make.bottom.mas_equalTo(Cell2).with.offset(-5);
            make.top.mas_equalTo(Cell2).with.offset(5);
            make.left.mas_equalTo(Cell2).with.offset(150);
        }];
        
        return Cell2;
    }else if (indexPath.section == 2)
    {
        
        NSString *reuseIdentifierString = @"PAYWAYCELL";
        PayWayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifierString];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"PayWayTableViewCell" owner:nil options:nil] lastObject];
        }
        
        
        if (indexPath.row == 0) {
            
            
            cell.titleImageView.image = [UIImage imageNamed:@"zhiPay"];
            cell.payNameLabel.text = @"支付宝支付";
            
            
            cell.detailLabel.text = @"推荐已安装支付宝客户端的用户使用";
            cell.detailLabel.textColor=RGB(121, 121, 121);
            cell.detailLabel.font=[UIFont systemFontOfSize:13];
            if (isChecked) {
                cell.checkedImageView.image = [UIImage imageNamed:@"Nocheck"];
            } else {
                cell.checkedImageView.image = [UIImage imageNamed:@"checked"];
            }
        } else {
            
            cell.titleImageView.image = [UIImage imageNamed:@"weiChat"];
            cell.payNameLabel.text = @"微信支付";
            cell.detailLabel.text = @"推荐已安装微信客户端的用户使用";
            cell.detailLabel.textColor=RGB(121, 121, 121);
             cell.detailLabel.font=[UIFont systemFontOfSize:13];
            if (isChecked) {
                cell.checkedImageView.image = [UIImage imageNamed:@"checked"];
            } else {
                cell.checkedImageView.image = [UIImage imageNamed:@"Nocheck"];
            }
        }
        return cell;
    } else {
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2 && indexPath.row == 0) {
        isChecked = NO;
    }
    
    if (indexPath.section == 2 && indexPath.row == 1) {
        isChecked = YES;
    }
    
    [self.PayCenterView reloadData];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField

{
    
    [self.banaceField resignFirstResponder];
    
    return YES;
    
}
#pragma mark --选择事件
- (void)isBoolSelected
{
    isChecked = NO;
//    [self.PayCenterView reloadData];
    

}
- (void)isBoolSelectedweichat
{
    isChecked = YES;
//    [self.PayCenterView reloadData];
    


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
