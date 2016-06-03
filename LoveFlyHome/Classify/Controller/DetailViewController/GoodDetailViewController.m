//
//  GoodDetailViewController.m
//  LoveFlyHome
//
//  Created by gpf on 16/5/30.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "GoodDetailViewController.h"
#import "Header.h"
#import "SDCycleScrollView.h"
#import "ZImageBrowser.h"
#import "DetailFootView.h"
#import "BuyPushView.h"
#import "TextView.h"


@interface GoodDetailViewController ()<UITableViewDelegate, UITableViewDataSource,ZImageBrowserDelegate,UINavigationBarDelegate,UITabBarDelegate,UITextFieldDelegate>
{
    UINavigationBar *bar;
}
@property (nonatomic, strong) UITableView * baseTableView;
@property (nonatomic, strong) ZImageBrowser *browser;//图片展示页
@property (nonatomic, strong) NSArray * scrollImages;
@property (nonatomic, strong) UIView * footerView;
@property (nonatomic, strong) UIButton * touchButton;
@property (nonatomic, strong) UIButton * touchButton2;
@property (nonatomic, strong) BuyPushView * buyView;
@property (nonatomic, assign) int goodsNum;
@property (nonatomic, assign) CGFloat XQListHeight;
@end

@implementation GoodDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _goodsNum = 1;
    _XQListHeight = 500;
    [self setUpControl];
    [self addBuyButton];
    self.navigationController.delegate =self;
    
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}


- (void)setUpControl{
    _baseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGwidth, CGHeight) style:UITableViewStyleGrouped];
    [self.view addSubview:_baseTableView];
    [_baseTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _baseTableView.dataSource = self;
    _baseTableView.delegate = self;
    _baseTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _scrollImages = [@[] mutableCopy];
    
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"图标-21"] style:UIBarButtonItemStylePlain target:self action:@selector(buy)];
    self.navigationItem.rightBarButtonItem = rightButton;
     rightButton.tintColor = [UIColor backGroundColor];//设置item的背景颜色
    self.tabBarController.tabBar.hidden = YES;
}


- (void)buy{
    NSLog(@"购买");
}

- (void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
//    self.navigationController.navigationBar.barTintColor = [UIColor buyGoodsBackColor];//修改navigationBar颜色
}


#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 200;
    }
    return 30;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 70;
    }
    return _XQListHeight;
}
//
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
//返回区头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headerView = [[UIView alloc] init];
    if (section == 0) {
        SDCycleScrollView* cycleView = [self addScrollView];
        [headerView addSubview:cycleView];
        return headerView;
    }
    UIView * headerView2 = [[UIView alloc] init];
    
    UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGwidth, 2)];
    lineView.backgroundColor = [UIColor lineViewColor];
    [headerView2 addSubview:lineView];
    
    UIButton * touchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [touchButton setFrame:CGRectMake(0, 0, CGwidth, 30)];
    [headerView2 addSubview:touchButton];
    [touchButton addTarget:self action:@selector(goodsSize:) forControlEvents:UIControlEventTouchUpInside];
    [touchButton setTitle:@"    规格:1.0Kg" forState:UIControlStateNormal];
    [touchButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    touchButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;//左对齐
    return headerView2;
}

- (void)goodsSize:(UIButton *)sender
{
    NSLog(@"选择规格");
}

- (SDCycleScrollView *)addScrollView
{
    _scrollImages = @[
                      @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                      @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                      @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                      ];
    
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, CGwidth, 200) imageURLStringsGroup:_scrollImages]; // 模拟网络延时情景
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.delegate = self;
    
    cycleScrollView2.hidesForSinglePage = YES;
    cycleScrollView2.autoScroll = NO;
    //当前pagecontroller小圆点的颜色
    cycleScrollView2.currentPageDotColor = [UIColor greenColor];
    //设置占位图
    cycleScrollView2.placeholderImage = [UIImage imageNamed:@"轮播占位图"];
    //设置pagecontroller所在位置
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    //pagecontroller显示样式
    cycleScrollView2.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    return cycleScrollView2;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 0) {
        NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"DetailFootView" owner:nil options:nil];
        DetailFootView * footerView = [nibView objectAtIndex:0];
        return footerView;
    }
    UIView * footerView2 = [[UIView alloc] init];
    TextView * textView = [TextView makeNewCoreTextViewWithImageNum:5 withView:self.view];
    textView.frame = CGRectMake(0, 0, CGwidth, 1021);
//    textView.backgroundColor = [UIColor greenColor];
    [footerView2 addSubview:textView];
    footerView2.backgroundColor = [UIColor whiteColor];
    return footerView2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor = [UIColor lineViewColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld, %ld", (long)indexPath.section, (long)indexPath.row);
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSMutableArray * imageArr = [@[] mutableCopy];
    for (int i = 0; i < _scrollImages.count; i++) {
        UIImage * image = [self getImageFromURL:[_scrollImages objectAtIndex:i]];
        [imageArr addObject:image];
    }
    _browser = [[ZImageBrowser alloc] init];
    _browser.enableTapGesture = YES;
    _browser.delegate = self;
    _browser.doubleTapSclaeZoom = @(1.5);
    _browser.images = imageArr;
    [self presentViewController:_browser animated:YES completion:nil];
    NSLog(@"---点击了第%ld张图片", (long)index);
}


-(UIImage *) getImageFromURL:(NSString *)fileURL {
    NSLog(@"执行图片下载函数");
    UIImage * result;
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    return result;
}

- (void)imageBroser:(ZImageBrowser *)broswer didTapImageAtIndex:(NSInteger)index {
    NSLog(@"%zd", index);
    self.tabBarController.tabBar.hidden = YES;
    [_browser dismissViewControllerAnimated:YES completion:nil];
}

//添加购买按键
- (void)addBuyButton
{
    _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, CGHeight - 44, CGwidth, 44)];
    _footerView.backgroundColor = [UIColor colorWithRed:124 green:124 blue:124 alpha:0.5];
    
    UIButton * addManButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, CGwidth/ 2, 44)];
    [addManButton addTarget:self action:@selector(pushToBuyView) forControlEvents:UIControlEventTouchUpInside];
    [addManButton setTitle:@"加入购物车" forState:UIControlStateNormal];
    UIButton * addGroupButton = [[UIButton alloc] initWithFrame:CGRectMake(CGwidth / 2 , 0, CGwidth  / 2, 44)];
    [addGroupButton addTarget:self action:@selector(pushToBuyView) forControlEvents:UIControlEventTouchUpInside];
    [addGroupButton setTitle:@"立即购买" forState:UIControlStateNormal];
    [addManButton setBackgroundColor:[UIColor addGoodsBackColor]];
    [addGroupButton setBackgroundColor:[UIColor buyGoodsBackColor]];
    
    UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(CGwidth / 2 - 1, 0, 1, 44)];
    lineView.backgroundColor = [UIColor grayColor];
    lineView.alpha = 0.5;
    [_footerView addSubview:lineView];
    [_footerView addSubview:addManButton];
    [_footerView addSubview:addGroupButton];
    [self.view addSubview:_footerView];
}

- (void)pushToBuyView
{
    _buyView = [BuyPushView getPushBuyViewWithView:self.view];
    [self addBuyViewControl];
    
    _touchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _touchButton.backgroundColor = [UIColor blackColor];
    [_touchButton setFrame:CGRectMake(0, 0, CGwidth, CGHeight / 3)];
    _touchButton.alpha = .7;
    [_touchButton addTarget:self action:@selector(disappearBuyView) forControlEvents:UIControlEventTouchUpInside];
    self.tabBarController.tabBar.hidden = YES;
    
    [UIView animateWithDuration:.1 // 动画时长
                     animations:^{
                         [_buyView setFrame:CGRectMake(0, CGHeight / 3, CGwidth, CGHeight)];
                     }
                     completion:^(BOOL finished) {
                         [self.view addSubview:_touchButton];
                     }];
    
    [self.view addSubview:_buyView];
}

- (void)addBuyViewControl
{
    _buyView.buyNumField.delegate = self;
    _buyView.buyNumField.text = [NSString stringWithFormat:@"%d", _goodsNum];
    [_buyView.dismissButton addTarget:self action:@selector(disappearBuyView) forControlEvents:UIControlEventTouchUpInside];
    [_buyView.sureButton addTarget:self action:@selector(sureBuy) forControlEvents:UIControlEventTouchUpInside];

    [_buyView.addButton addTarget:self action:@selector(addGoodsNum:) forControlEvents:UIControlEventTouchUpInside];
    [_buyView.reduceButton addTarget:self action:@selector(reductionGoodsNum:) forControlEvents:UIControlEventTouchUpInside];
}

//使buyView退出
- (void)disappearBuyView{
    self.tabBarController.tabBar.hidden = YES;
    [_touchButton removeFromSuperview];
    [UIView animateWithDuration:.1 // 动画时长
                     animations:^{
                         [_buyView setFrame:CGRectMake(0, CGHeight, CGwidth, CGHeight)];
                     }];
     NSLog(@"---%@", _buyView.buyNumField.text);
}

- (BOOL)textFieldShouldBeginEditing:(UITextView *)textView{
    NSLog(@"开始编辑");
    _touchButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_touchButton2];
    [_touchButton2 addTarget:self action:@selector(disMissKeyBoard:) forControlEvents:UIControlEventTouchUpInside];
    
    [UIView animateWithDuration:.1 animations:^{
        [_touchButton2 setFrame:CGRectMake(0, 0, CGwidth, CGHeight - 264)];
        [_touchButton setFrame:CGRectMake(0, 0, CGwidth, CGHeight / 3 - 60)];
        [_buyView setFrame:CGRectMake(0, CGHeight / 3 - 60, CGwidth, CGHeight)];
    }];
    return YES;
}

//设置键盘收回
- (void)disMissKeyBoard:(UIButton *)sender
{
    _goodsNum = (int)_buyView.buyNumField.text;
    [_touchButton2 removeFromSuperview];
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    [UIView animateWithDuration:.1 animations:^{
        [_touchButton setFrame:CGRectMake(0, 0, CGwidth, CGHeight / 3)];
        [_buyView setFrame:CGRectMake(0, CGHeight / 3, CGwidth, CGHeight)];
    }];
    NSLog(@"---%@", _buyView.buyNumField.text);
}


#pragma mark -改变购买数量的方法
- (void)addGoodsNum:(UIButton *)sender
{
    NSLog(@"数量加一");
    _goodsNum++;
    _buyView.buyNumField.text = [NSString stringWithFormat:@"%d", _goodsNum];
}
- (void)reductionGoodsNum:(UIButton *)sender
{
    NSLog(@"数量减一");
    if (_goodsNum > 1) {
        _goodsNum--;
        _buyView.buyNumField.text = [NSString stringWithFormat:@"%d", _goodsNum];
    }
}

- (void)sureBuy
{
    [self disappearBuyView];
    NSLog(@"+++++===%@", _buyView.buyNumField.text);
    NSLog(@"加入购物车");
    
}

@end
