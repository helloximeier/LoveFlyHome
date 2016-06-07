//
//  LFHSelectWorMViewController.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/7.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHSelectWorMViewController.h"
#import "Public.h"
#import "Masonry.h"
@interface LFHSelectWorMViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSIndexPath *_selectIndexPath;
    UIImageView *_mainImage;
    UIImageView *_womenImage;


}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataSource;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIView *centerView;
@end

@implementation LFHSelectWorMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self setNavGation];
    self.titleLabel.text=@"性别";
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,64,screen_width, screen_height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorColor = RGBA(235, 235, 235, 1.0);
//    [self.centerView addSubview:self.tableView];
    self.dataSource = [[NSArray alloc]initWithObjects:@"男",@"女", nil];
}

- (void)setNavGation
{
    UIView *headerView=[UIView new];
    headerView.backgroundColor=RGB(64, 186, 64);
    [self.view addSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).with.offset(0);
        make.top.mas_equalTo(self.view).with.offset(0);
        make.right.mas_equalTo(self.view).with.offset(0);
        make.height.mas_equalTo(64);
    }];
    
    UIButton *backbtn=[UIButton new];
    [backbtn setImage:[UIImage imageNamed:@"navigation_bar_back"] forState:UIControlStateNormal];
    [backbtn setTintColor:[UIColor whiteColor]];
    [headerView addSubview:backbtn];
    [backbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(headerView).with.offset(10);
        make.bottom.mas_equalTo(headerView).with.offset(-10);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(30);
    }];
    [backbtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *completeBtn=[UIButton new];
    [completeBtn setTitle:@"完成" forState:UIControlStateNormal];
    [completeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [headerView addSubview:completeBtn];
    [completeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(headerView).with.offset(-15);
        make.bottom.mas_equalTo(headerView).with.offset(-10);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(30);
    }];
    [completeBtn addTarget:self action:@selector(CompleteBtnClick) forControlEvents:UIControlEventTouchUpInside];

}

#pragma mark --返回上一级
- (void)backClick
{
    
    [self.navigationController popViewControllerAnimated:YES];

}

#pragma mark --跳到上一级
- (void)CompleteBtnClick
{

    NSLog(@"完成");
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identify = @"sexCell";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = self.dataSource[indexPath.row];
    /**右侧标识图*/
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    ;
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(screen_width - 70, 11, 20, 20)];
    image.image = [UIImage imageNamed:@"qiandao@3x.png"];
    image.tag = 300 + indexPath.row;
    image.hidden = YES;
    [cell.contentView addSubview:image];
    if (indexPath.row == 0) {
        _mainImage = image;
    }
    if (indexPath.row == 1) {
        _womenImage = image;
    }
    if ([self.dataSource[indexPath.row] isEqualToString:self.sex]) {
        image.hidden = NO;
    }
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _selectIndexPath = indexPath;
//    [self showProgress:@"修改中"];
//    [self DataRequest:@{@"tid":[UserInformation shareUserInfo].userID,@"teasex":[NSNumber numberWithInteger:indexPath.row + 1]}];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
