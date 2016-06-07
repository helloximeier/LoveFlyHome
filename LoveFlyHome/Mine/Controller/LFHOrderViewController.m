//
//  LFHOrderViewController.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/1.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHOrderViewController.h"
#import "LFHSegmentedControl.h"
#import "Public.h"
#import "Masonry.h"
#import "LFHOrderCell.h"
@interface LFHOrderViewController ()<LFHSegmentedControlDelegate,UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic)UITableView *orderTableView;
@property(strong,nonatomic)LFHSegmentedControl * segment;
@end

@implementation LFHOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self setBackNav];
    [self setOrdrPage];
   
}

- (void)setBackNav
{
    UIView *navView=[UIView new];
    navView.backgroundColor=RGB(64, 186, 64);
    [self.view addSubview:navView];
    [navView mas_makeConstraints:^(MASConstraintMaker *make) {
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
    [navView addSubview:backButton];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(navView).with.offset(10);
        make.top.mas_equalTo(navView).with.offset(30);
        make.bottom.mas_equalTo(navView).with.offset(-10);
        make.width.equalTo(@20);
    }];
   
    

}

- (void)viewDidAppear:(BOOL)animated
{
    [self setTabView];

}

#pragma mark -返回
- (void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
#pragma mark -我的订单
- (void)setOrdrPage
{
    
    NSArray *btnDataSource=@[@"待付款",@"待发货",@"待收货",@"已完成"];
    
   self.segment = [LFHSegmentedControl segmentedControlFrame:CGRectMake(0, 64, self.view.bounds.size.width, 44) titleDataSource:btnDataSource backgroundColor:[UIColor whiteColor] titleColor:[UIColor blackColor] titleFont:[UIFont fontWithName:@".Helvetica Neue Interface" size:16.0f] selectColor:RGB(64, 186, 64) buttonDownColor:RGB(64, 186, 64) Delegate:self];
    [self.view addSubview:self.segment];

}

- (void)segMentSelectedChange:(NSInteger)selection
{
    if(selection==0)
    {
        NSLog(@"待付款");
        /**调用创建表格**/
        [self setTabView];
    }else  if(selection==1)
    {
        NSLog(@"待发货");
    }else if(selection==2)
    {
        NSLog(@"待收货");
    }else
    {
        NSLog(@"已完成");
    }


}

#pragma mark -创建表格
- (void)setTabView
{
    self.orderTableView=[UITableView new];
    self.orderTableView.delegate=self;
    self.orderTableView.dataSource=self;
    [self.view addSubview:self.orderTableView];
    [self.orderTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).with.offset(0);
        make.top.mas_equalTo(self.segment).with.offset(44);
        make.right.mas_equalTo(self.view).with.offset(0);
        make.height.equalTo(self.view.mas_height);
    }];


}
#pragma mark --实现协议里面的方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 146.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *orderCell=@"orderCell";
    LFHOrderCell *orderCELL=[tableView dequeueReusableCellWithIdentifier:orderCell];
    if(!orderCELL)
    {
        orderCELL=[[[NSBundle mainBundle] loadNibNamed:@"LFHOrderCell" owner:self options:nil] lastObject];
    
    }

    return orderCELL;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
