//
//  InformationTableView.m
//  LoveFlyHome
//
//  Created by gpf on 16/6/1.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "InformationTableView.h"
#import "InformationCell.h"
#import "StatusTableController.h"

@interface InformationTableView ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation InformationTableView

- (void)viewDidLoad {
    [super viewDidLoad];
     [self.tableView registerNib:[UINib nibWithNibName:@"InformationCell" bundle:nil] forCellReuseIdentifier:@"InformationCell"];
    
    self.tabBarController.tabBar.hidden = YES;
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    
    self.navigationItem.title = @"订单状态";
    
}

- (void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 95;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InformationCell * cell = [tableView dequeueReusableCellWithIdentifier:@"InformationCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"InformationCell" forIndexPath:indexPath];
    }
    [cell.productImage.layer setMasksToBounds:YES];
    [cell.productImage.layer setCornerRadius:10.0];//设置矩形四个圆角半径
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    StatusTableController * statusController = [[StatusTableController alloc] init];
    [self.navigationController pushViewController:statusController animated:YES];
}


@end
