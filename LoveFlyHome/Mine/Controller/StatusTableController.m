//
//  StatusTableController.m
//  LoveFlyHome
//
//  Created by gpf on 16/6/1.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "StatusTableController.h"
#import "StatesHeaderView.h"
#import "StatesTableCell.h"
//#import "Header.h"
#import "Public.h"

@interface StatusTableController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView * baseTable;
@property (nonatomic, strong) StatesHeaderView * headerView;

@end

@implementation StatusTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self addControl];
    [self.tableView registerNib:[UINib nibWithNibName:@"StatesTableCell" bundle:nil] forCellReuseIdentifier:@"StatesTableCell"];

    
}

- (void)addControl{
    _baseTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height + 44) style:UITableViewStyleGrouped];
    self.tableView = _baseTable;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tabBarController.tabBar.hidden = YES;
    
}
- (void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.backgroundColor=RGB(64, 186, 64);
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 130;
    }
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 138;
    }
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }
    return 0.001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        _headerView = [StatesHeaderView statesHeaderViewMake:self.tableView];
        _headerView.backgroundColor = RGB(64, 186, 64);
        return _headerView;
    }
    UIView * headerView1 = [[UIView alloc] init];
    return headerView1;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView * footerView = [[UIView alloc] init];
//    footerView.backgroundColor = [UIColor lineViewColor];
    return footerView;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        StatesTableCell * cell = [tableView dequeueReusableCellWithIdentifier:@"StatesTableCell"];
//        cell.backgroundColor = [UIColor redColor];
        return cell;
    }
    NSArray * titleArr = [NSArray arrayWithObjects:@"订单详情", @"联系人:李明",@"联系电话:10086",@"收货地址:地狱",@"支付方式:在线支付",@"下单时间2012",@"订单详情",nil];
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = [titleArr objectAtIndex:indexPath.row];
    if (indexPath.row == 0) {
        [cell.textLabel setFont:[UIFont fontWithName:nil size:18.0f]];
    }
    if (indexPath.row != 0) {
        [cell.textLabel setTextColor:[UIColor grayColor]];
    }
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
