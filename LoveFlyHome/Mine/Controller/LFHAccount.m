//
//  LFHAccount.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/1.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHAccount.h"

@interface LFHAccount ()<UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic)UITableView *accountTabView;

@end

@implementation LFHAccount

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark --创建表
- (void)setAccountTable
{
    self.accountTabView=[[UITableView alloc] init];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
