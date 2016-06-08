//
//  DetailViewConroller.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/8.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "DetailViewConroller.h"
#import "Masonry.h"
#import "Public.h"
#import "LFHDetailViewCell.h"
@interface DetailViewConroller ()<UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic) UIView *navView;
@property(strong,nonatomic) UITableView *detailView;
@end

@implementation DetailViewConroller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self setNavgationView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma mark --表格
- (void)setBalanceViewTable
{
    self.detailView =[[UITableView alloc] initWithFrame:CGRectMake(0, 64, screen_width, screen_height)];
    self.detailView.delegate=self;
    self.detailView.dataSource=self;
    [self.view addSubview:self.detailView];
    [self.detailView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [self.detailView setSeparatorColor:RGB(235, 235, 235)];
    
}

#pragma mark --datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *acell=@"acell";
    LFHDetailViewCell *detailCell=[tableView dequeueReusableCellWithIdentifier:acell];
    if(!detailCell)
    {
        detailCell =[[LFHDetailViewCell alloc] init];
    
    }
    
    return detailCell;


}

@end
