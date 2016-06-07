//
//  ShopCarPageCtrl.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/5/26.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "FLCartViewController.h"
#import "ShopingCarCell.h"
#import "AccountView.h"
#import "InformationTableView.h"
#import "Header.h"
#import "GoodDetailViewController.h"
#import "Public.h"
#import "DBHelper.h"
#import "GoodsInfo.h"
@interface FLCartViewController ()<UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate>
{
    DBHelper *_helper;

}
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) AccountView * footerView;
@property (nonatomic, strong) UIButton * touchButton;
@property (nonatomic, assign) int goodsNum;
@property (nonatomic, strong) ShopingCarCell *shopping;
@property (nonatomic, strong) GoodsInfo *goodsInfo;

@end

@implementation FLCartViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    /**
     *实例化数据库
     **/
    _helper=[[DBHelper alloc] init];
   
    
    
    
    [self addViewControl];
    [self addFooterView];
    self.tabBarController.tabBar.hidden = NO;
  
    
}



- (void)addViewControl{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGwidth, CGHeight - 44) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];

    [self.tableView registerNib:[UINib nibWithNibName:@"ShopingCarCell" bundle:nil] forCellReuseIdentifier:@"ShopingCarCell"];
    _touchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_touchButton setFrame:CGRectMake(0, 0, CGwidth, CGHeight - 250)];
    
    
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"图标-16.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pushToInformationView)];
    self.navigationItem.rightBarButtonItem = rightButton;
    rightButton.tintColor = [UIColor whiteColor];//设置item的背景颜色
    
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    
    self.navigationItem.title = @"我的购物车";
    self.navigationController.navigationBar.backgroundColor=RGB(64, 186 ,64);

    
    //设置返回按键的颜色
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    //设置返回界面中返回按键的内容
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"消息"
                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backButton];
    
    
    
}

- (void)pushToInformationView
{
    NSLog(@"进入消息界面");
    InformationTableView * inforTableView = [[InformationTableView alloc] init];
    [self.navigationController pushViewController:inforTableView animated:YES];
}

- (void)addFooterView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"AccountView" owner:nil options:nil];
    _footerView = [nibView objectAtIndex:0];
    [_footerView setFrame:CGRectMake(0, CGHeight - 60, CGwidth, 44)];
    [self.view addSubview:_footerView];

    [self.view addSubview:_footerView];
}
#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
//返回区头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor orangeColor];
    
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShopingCarCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ShopingCarCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ShopingCarCell" forIndexPath:indexPath];
    }
    /**查询语句**/
    NSString *sql=[NSString stringWithFormat:@"select * from GoodsInfoTable where GoodsID=%ld",cell.goodsId];
    NSLog(@"============%@",[_helper getGoodsInfo:sql]);

    if([_helper getGoodsInfo:sql])
    {
        cell.goodsId=_goodsInfo.GoodsID;
       cell.titleLabel.text=_goodsInfo.GoodsName;
        cell.priceLabel.text=_goodsInfo.GoodsPrice;
        cell.productImageButton.imageView.image=(UIImage *)_goodsInfo.GoodsImage;
        cell.productTextField.text=_goodsInfo.GoodsNums;
        NSLog(@"查询成功");
        
    }else
    {
        NSLog(@"失败");
        
    }
    

//    cell.productTextField.delegate=self;
//    cell.productTextField.text=[NSString stringWithFormat:@"%d",_goodsNum];
    
  
    [cell.addButton addTarget:self action:@selector(addGoods:) forControlEvents:UIControlEventTouchUpInside];
    [cell.reduceButton addTarget:self action:@selector(reduceGoods:) forControlEvents:UIControlEventTouchUpInside];
     [cell.deleteButton addTarget:self action:@selector(deleteGoods:) forControlEvents:UIControlEventTouchUpInside];
    [cell.productImageButton addTarget:self action:@selector(touchProductImage:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.productTextField.delegate = self;
    return cell;
}
- (void)touchProductImage:(UIButton *)sender
{
    //进图到商品的详情页
    GoodDetailViewController * shopDetailView = [[GoodDetailViewController alloc] init];
    [self.navigationController pushViewController:shopDetailView animated:YES];
}
- (void)addGoods:(UIButton *)sender
{
    NSLog(@"添加商品");
    _goodsNum++;
    self.shopping.productTextField.text=[NSString stringWithFormat:@"%d",_goodsNum];
}

- (void)reduceGoods:(UIButton *)sender
{
    if(_goodsNum>1)
    {
        _goodsNum--;
        self.shopping.productTextField.text=[NSString stringWithFormat:@"%d",_goodsNum];
    
    }
    NSLog(@"减少商品");
}
- (void)deleteGoods:(UIButton *)sender
{
   NSLog(@"删除商品");
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}



- (BOOL)textFieldShouldBeginEditing:(UITextView *)textView{
    [_touchButton addTarget:self action:@selector(dismissKeyBoard:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_touchButton];
    return YES;
}

- (void)dismissKeyBoard:(UIButton *)sender
{
    [_touchButton removeFromSuperview];
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}



@end
