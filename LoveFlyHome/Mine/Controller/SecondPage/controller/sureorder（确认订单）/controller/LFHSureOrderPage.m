//
//  LFHSureOrderPage.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/12.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHSureOrderPage.h"
#import "Masonry.h"
#import "Public.h"
#import "LFHSureAddressCell.h"
#import "LFHGoodsItemCell.h"
#import "LFHOnlineOrCashCell.h"
@interface LFHSureOrderPage ()<UITableViewDataSource,UITableViewDelegate>
{
    BOOL isChecked;

}
@property(strong,nonatomic)UITableView *sureOrderTable;
@property(strong,nonatomic)UIView *navView;

@end

@implementation LFHSureOrderPage

- (void)viewDidLoad {
    [super viewDidLoad];
    isChecked=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    [self setSureTable];
    [self setButtomBtn];
    
}

#pragma mark --设置底部button
- (void)setButtomBtn
{
    UIButton *leftBtn=[UIButton new];
    leftBtn.backgroundColor=RGB(235, 235, 235);
    [self.view addSubview:leftBtn];
    [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).with.offset(0);
        make.bottom.mas_equalTo(self.view).with.offset(0);
        make.height.mas_equalTo(70);
        make.right.mas_equalTo(self.view).with.offset(screen_width/2+30);
    }];
    UILabel *AcombinedLab=[UILabel new];
    AcombinedLab.text=@"合计：";
    

}

#pragma mark --设置表格
- (void)setSureTable
{
    self.sureOrderTable=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height) style:UITableViewStylePlain];
    self.sureOrderTable.delegate=self;
    self.sureOrderTable.dataSource=self;
    /**设置分割线颜色**/
    [self.sureOrderTable setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [self.sureOrderTable setSeparatorColor:RGB(235, 235, 235)];
    [self.view addSubview:self.sureOrderTable];


}

#pragma mark --datasourse
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0)
    {
        return 1;
    }else if (section==1)
    {
        return 1;
    }
    
    else
    {
        return 2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        return 150;
    }else if (indexPath.section==1)
    {
        return 170;
    }else if (indexPath.section==2)
    {
        return 50;
    }else
    {
        if(indexPath.row==0)
        {
            return 50;
        }else
        {
            return 200;
        }
        
    }


}

#pragma mark --尾部
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;


}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView=[UIView new];
    footerView.backgroundColor=RGB(235, 235, 235);
    footerView.frame=CGRectMake(0, 0, screen_width, 10);
    [tableView addSubview:footerView];
    return footerView;


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        static NSString *acell=@"acell";
        LFHSureAddressCell *cell=[tableView dequeueReusableCellWithIdentifier:acell];
        if(!cell)
        {
            cell=[[[NSBundle mainBundle] loadNibNamed:@"LFHSureAddressCell" owner:self options:nil] objectAtIndex:0];
        
        }
        /**右侧标识图*/
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
        ;
        return cell;
    
    }else if(indexPath.section==1)
    {
        static NSString *goodsAcell=@"goodscell";
        LFHGoodsItemCell *goodsItemCell=[tableView dequeueReusableCellWithIdentifier:goodsAcell];
        if(!goodsItemCell)
        {
            goodsItemCell=[[[NSBundle mainBundle] loadNibNamed:@"LFHGoodsItemCell" owner:self options:nil] objectAtIndex:0];
        
        }
        
        return goodsItemCell;
    }else if (indexPath.section==2)
    {
        NSString *reuseIdentifierFirstString=@"payCell";
        LFHOnlineOrCashCell *Cell=[tableView dequeueReusableCellWithIdentifier:reuseIdentifierFirstString];
        if(!Cell)
        {
        
            Cell=[[[NSBundle mainBundle] loadNibNamed:@"LFHOnlineOrCashCell" owner:self options:nil] objectAtIndex:0];
        }
        
        if(indexPath.row==0)
        {
            Cell.payLable.text=@"在线支付";
            
            if(isChecked)
            {
                Cell.checkImage.image=[UIImage imageNamed:@"dz-2"];
            
            }else
            {
                Cell.checkImage.image=[UIImage imageNamed:@"dz-1"];
            }
           
        }else
        {
            Cell.payLable.text=@"货到付款";
            if(isChecked)
            {
                Cell.checkImage.image=[UIImage imageNamed:@"dz-1"];
            }else
            {
                Cell.checkImage.image=[UIImage imageNamed:@"dz-2"];
            }
  
        }
        return Cell;
    
    }

    else
    {
    
        static NSString *bcell=@"bcell";
        UITableViewCell *Bcell=[tableView dequeueReusableCellWithIdentifier:bcell];
        if(!Bcell)
        {
            Bcell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:bcell];
            
        }
        
        if(indexPath.row==0)
        {
            Bcell.textLabel.text=@"配送方式";
            /**cell右侧标识符**/
            Bcell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            UILabel *CourierLb=[UILabel new];
            CourierLb.text=@"快递：";
            [Bcell addSubview:CourierLb];
            [CourierLb mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(Bcell).with.offset(-60);
                make.top.mas_equalTo(Bcell).with.offset(5);
                make.bottom.mas_equalTo(Bcell).with.offset(-5);
                make.width.mas_equalTo(60);
            }];
            
            
        
        }else
        {
            UILabel *BuyerMessageLab=[UILabel new];
            BuyerMessageLab.text=@"买家留言：";
            [Bcell addSubview:BuyerMessageLab];
            [BuyerMessageLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(Bcell).with.offset(10);
                make.topMargin.mas_equalTo(Bcell).with.offset(5);
                make.width.mas_equalTo(100);
                make.height.mas_equalTo(30);
            }];

        }
        
        return Bcell;
    
    }


}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==2 && indexPath.row==0)
    {
        isChecked=NO;
    }else if(indexPath.section==2 && indexPath.row==1)
    {
        isChecked=YES;
    }
    
    [self.sureOrderTable reloadData];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
