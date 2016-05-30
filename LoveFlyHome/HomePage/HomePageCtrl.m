//
//  HomePageCtrl.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/5/26.
//  Copyright © 2016年 Lefeng. All rights reserved.

#import "HomePageCtrl.h"
#import "SearchBarView.h"
#import "UIBarButtonItem+Extension.h"
#import "wheelCell.h"
#import "RushCell.h"
#import "RushDealsModel.h"
#import "BargainPriceCell.h"
#define WIDTH self.view.bounds.size.width
@interface HomePageCtrl()<searchBarViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView *tabView;
@end
@implementation HomePageCtrl

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**调用导航栏**/
    [self setNavgationController];
    /**调用创建表格视图的方法***/
    [self setupTabView];
}

#pragma mark -设置导航栏
- (void)setNavgationController
{
    /**导航栏左边**/
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem barButtonLeftItemWithImageName:@"图标-14" target:self action:@selector(scanClick)];
    /**导航栏右边**/
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem barButtonRightItemWithImageName:@"图标-16" target:self action:@selector(bellsclick)];
    /**将搜索条放到一个uiview上**/
    SearchBarView *searchview=[[SearchBarView alloc] initWithFrame:CGRectMake(0, 7, 240, 30)];
    searchview.delegate=self;
    self.navigationItem.titleView = searchview;
    
    
}
#pragma mark -左边按钮事件
- (void)scanClick
{
    NSLog(@"扫一扫");

}
#pragma mark -右边按钮事件
- (void)bellsclick
{
    NSLog(@"消息");

}

#pragma mark -请求抢购的数据
- (void)getRushBuyDatas
{
    
    





}


#pragma mark -创建表格视图
- (void)setupTabView
{
    self.tabView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0,WIDTH , self.view.bounds.size.height)];
    self.tabView.dataSource=self;
    self.tabView.delegate=self;
    self.tabView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.tabView];

}

#pragma mark -实现协议里面的方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

#pragma mark -返回每组高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        return 150.0;
    }else if (indexPath.section==1)
    {
        return 170.0;
    }else if (indexPath.section==2)
    {
        return 150.0;
    }else if (indexPath.section==3)
    {
        return 200.0;
    }else if(indexPath.section==4)
    {
        return 200.0;
    }
    return 0;

}
#pragma mark -头部
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section==1)
    {
        return 1;
    }else
    {
        return 5;
    }
}

#pragma mark -脚部
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    if(section==1)
    {
        return 1;
    }
    return 5;
    
}
#pragma mark -头部视图大小 颜色
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView=[[UIView alloc] initWithFrame:CGRectMake(0, 0,WIDTH, 0.1)];
    headView.backgroundColor=[UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1.0];
    return headView;
    
}

#pragma mark -脚部视图大小 颜色
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 0)];
    
    footView.backgroundColor=[UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1.0];
    return footView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        //        滚动视图
        static NSString *acell=@"wheelcell";
        wheelCell *cell=[tableView dequeueReusableCellWithIdentifier:acell];
        if(cell==nil)
        {
            
            cell=[[wheelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:acell];
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if (indexPath.section==1)
    {
        static NSString *acell=@"acell";
        
        RushCell *cell=[tableView dequeueReusableCellWithIdentifier:acell];
        if(cell==nil)
        {
            cell=[[RushCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:acell];
          
        

            
        }
        
        
        return cell;

    
    }else if (indexPath.section==2)
    {
        static NSString *acell=@"acell";
        
        BargainPriceCell *cell=[tableView dequeueReusableCellWithIdentifier:acell];
        if(cell==nil)
        {
            cell=[[BargainPriceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:acell];
            
        }
        
        
        return cell;

    }else if (indexPath.section==3)
    {
        static NSString *acell=@"acell";
        
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:acell];
        if(cell==nil)
        {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:acell];
            
        }
        
        
        return cell;

    }else
    {
        static NSString *acell=@"acell";
        
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:acell];
        if(cell==nil)
        {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:acell];
            
        }
        
        
        return cell;

    
    }

    
    
}
#pragma mark -顶部滚动视图



@end
