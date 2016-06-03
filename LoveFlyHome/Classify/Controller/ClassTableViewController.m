//
//  ClassTableViewController.m
//  LoveFlyHome
//
//  Created by gpf on 16/5/27.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "ClassTableViewController.h"
#import "LeftTableCell.h"
#import "Header.h"


@interface ClassTableViewController ()
@property (nonatomic, strong) NSMutableArray * cellArray;
@property (nonatomic, strong) UITableView * baseTableView;

@end

@implementation ClassTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _baseTableView = [[UITableView alloc] initWithFrame:self.tableView.frame style:UITableViewStylePlain];
//    self.tableView = _baseTableView;
    
    self.view.backgroundColor = [UIColor backGroundColor];
    _cellArray = [@[] mutableCopy];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
//    self.tableView.separatorStyle = YES;
    [self.tableView registerNib:[UINib nibWithNibName:@"LeftTableCell" bundle:nil] forCellReuseIdentifier:@"LeftTableCell"];
//  self.tableView.separatorStyle = NO;
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.tableView
    
}



#pragma mark -
- (NSMutableArray *)titlesAry
{
    if (_titlesAry == nil) {
        self.titlesAry = [@[] mutableCopy];
    }
    return _titlesAry;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    LeftTableCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LeftTableCell"];
    
    [cell.textLabel setFont:[UIFont fontWithName:nil size:14.0f]];
    if (indexPath.row == 0) {
//        cell.backgroundColor = [UIColor redColor];
        cell.selected = YES;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeftTableCell * cell =[tableView cellForRowAtIndexPath:indexPath];
    cell.secondImageView.alpha = 0;
    [cell.textLabel setTextColor:[UIColor priceTitleColor]];
    
#warning 点击左侧table找到对应的右侧位置
//    [((GiftViewController *)self.parentViewController).rightVC.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.row] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

- (void)cellButtonAction:(UIButton *)sender
{
    NSLog(@"哈哈哈");
}

@end
