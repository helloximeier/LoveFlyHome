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
#import "LFHPayMentView.h"
#import "LFHDeliveryView.h"
#import "LFHForTheGoodsView.h"
#import "LFHHasbeencompletedView.h"
@interface LFHOrderViewController ()<LFHSegmentedControlDelegate>

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
        make.width.equalTo(@13);
    }];
   
    

}

- (void)viewDidAppear:(BOOL)animated
{
   [self ForThePayMent];

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
        [self ForThePayMent];
        
        
    }else  if(selection==1)
    {
        [self Tosendthegoods];
        NSLog(@"待发货");
    }else if(selection==2)
    {
        NSLog(@"待收货");
        [self Forthegoods];
        
    }else
    {
        NSLog(@"已完成");
        [self Hasbeencompleted];
    }


}

#pragma mark --待付款
- (void)ForThePayMent
{
    LFHPayMentView *payment=[[[NSBundle mainBundle]loadNibNamed:@"LFHPayMentView" owner:self options:nil]objectAtIndex:0];
    payment.frame=CGRectMake(0, 64+44,screen_width, 150);
    [self.view addSubview:payment];

}


#pragma mark --待发货
- (void)Tosendthegoods
{
    LFHDeliveryView *deliveryView=[[[NSBundle mainBundle] loadNibNamed:@"LFHDeliveryView" owner:self options:nil] objectAtIndex:0];
    
    deliveryView.frame=CGRectMake(0, 64+44, screen_width, 150);
    [self.view addSubview:deliveryView];


}

#pragma mark --待收货
- (void)Forthegoods
{
    LFHForTheGoodsView *forTheGoodsView=[[[NSBundle mainBundle] loadNibNamed:@"LFHForTheGoodsView" owner:self options:nil] objectAtIndex:0];
    forTheGoodsView.frame=CGRectMake(0, 64+44, screen_width, 150);
    [self.view addSubview:forTheGoodsView];

}

#pragma mark --已完成
- (void)Hasbeencompleted
{
    LFHHasbeencompletedView *hasheenCompleteView=[[[NSBundle mainBundle] loadNibNamed:@"LFHHasbeencompletedView" owner:self options:nil] objectAtIndex:0];
    hasheenCompleteView.frame=CGRectMake(0, 64+44, screen_width, 150);
    [self.view addSubview:hasheenCompleteView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
