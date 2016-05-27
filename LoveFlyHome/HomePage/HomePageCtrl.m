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
    NSString *url = @"http://api.meituan.com/group/v1/deal/activity/1?__skck=40aaaf01c2fc4801b9c059efcd7aa146&__skcy=NF9S7jqv3TVBAoEURoapWJ5VBdQ%3D&__skno=FB6346F3-98FF-4B26-9C36-DC9022236CC3&__skts=1434530933.316028&__skua=bd6b6e8eadfad15571a15c3b9ef9199a&__vhost=api.mobile.meituan.com&ci=1&client=iphone&movieBundleVersion=100&msid=48E2B810-805D-4821-9CDD-D5C9E01BC98A2015-06-17-14-50363&ptId=iphone_5.7&userid=10086&utm_campaign=AgroupBgroupD100Fab_chunceshishuju__a__a___b1junglehomepagecatesort__b__leftflow___ab_gxhceshi__nostrategy__leftflow___ab_gxhceshi0202__b__a___ab_pindaochangsha__a__leftflow___ab_xinkeceshi__b__leftflow___ab_gxtest__gd__leftflow___ab_gxh_82__nostrategy__leftflow___ab_pindaoshenyang__a__leftflow___i_group_5_2_deallist_poitype__d__d___ab_b_food_57_purepoilist_extinfo__a__a___ab_trip_yidizhoubianyou__b__leftflow___ab_i_group_5_3_poidetaildeallist__a__b___ab_waimaizhanshi__b__b1___a20141120nanning__m1__leftflow___ab_pindaoquxincelue__a__leftflow___ab_i_group_5_5_onsite__b__b___ab_i_group_5_6_searchkuang__a__leftflow&utm_content=4B8C0B46F5B0527D55EA292904FD7E12E48FB7BEA8DF50BFE7828AF7F20BB08D&utm_medium=iphone&utm_source=AppStore&utm_term=5.7&uuid=4B8C0B46F5B0527D55EA292904FD7E12E48FB7BEA8DF50BFE7828AF7F20BB08D&version_name=5.7";
    





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
        return 150.0;
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
        
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:acell];
        if(cell==nil)
        {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:acell];
            
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
