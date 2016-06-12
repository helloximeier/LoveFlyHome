//
//  LFHRushBuyControl.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/2.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHRushBuyControl.h"
#import "Public.h"
#import "wheelCell.h"
#import "Masonry.h"
#import "SDCycleScrollView.h"
#import "ZImageBrowser.h"
#import "LFHBottomBtnView.h"
#import "BuyPushView.h"
#import "TextView.h"
#import "Header.h"
#import "DetailFootView.h"
#import "LFHRushGoodsListItem.h"
#import "LFHSureOrderPage.h"
@interface LFHRushBuyControl ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,ZImageBrowserDelegate,UITabBarDelegate,UINavigationControllerDelegate,SDCycleScrollViewDelegate>

@property(strong,nonatomic)UITableView *baseTableView;
/**图片展示页**/
@property (nonatomic, strong) ZImageBrowser *browser;

@property(strong,nonatomic)LFHBottomBtnView *bottomBtnView;
@property (nonatomic, strong) NSArray * scrollImages;
@property (nonatomic, strong) UIView * footerView;

@property(strong,nonatomic)BuyPushView *buyView;
@property(assign,nonatomic)int goodsNum;
@property(assign,nonatomic)CGFloat XQListHeight;
@property (nonatomic, strong) UIButton * touchButton;
@property (nonatomic, strong) UIButton * touchButton2;

@property(nonatomic,strong)LFHRushGoodsListItem *rushGoodsListItem;

@end

@implementation LFHRushBuyControl

- (void)viewDidLoad {
    [super viewDidLoad];
    _goodsNum = 1;
    _XQListHeight = 500;
    [self setUpControl];

    self.navigationController.delegate =self;
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
//    [self setTableView];
    [self initBottomBtnView];
    
}
- (void)setUpControl{
    _baseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height) style:UITableViewStyleGrouped];
    [self.view addSubview:_baseTableView];
    [_baseTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _baseTableView.dataSource = self;
    _baseTableView.delegate = self;
    _baseTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _scrollImages = [@[] mutableCopy];
    
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"图标-21"] style:UIBarButtonItemStylePlain target:self action:@selector(buy)];
    self.navigationItem.rightBarButtonItem = rightButton;
    /**设置item的背景颜色**/
    rightButton.tintColor = [UIColor backGroundColor];
    self.tabBarController.tabBar.hidden = YES;

}

#pragma mark --购买
- (void)buy
{
    NSLog(@"购买");

}
#pragma mark --创建底部btn
- (void)initBottomBtnView
{
    self.bottomBtnView=[[LFHBottomBtnView alloc] initWithFrame:CGRectMake(0, screen_height-64-60, screen_width, 60)];
    [self.view addSubview:self.bottomBtnView];
    
    /**加入购物车**/
    [self.bottomBtnView.btn_shopCar addTarget:self action:@selector(addShopCarClick) forControlEvents:UIControlEventTouchUpInside];
    /**立即开抢**/
    [self.bottomBtnView.btn_Rush addTarget:self action:@selector(addShopCarClick) forControlEvents:UIControlEventTouchUpInside];
}

/**图片**/
- (SDCycleScrollView *)addScrollView
{
    _scrollImages = @[
                      @"http://pic.58pic.com/58pic/15/38/31/72E58PICbpK_1024.jpg",
                      @"http://image5.tuku.cn/pic/meishixinshang/VEGETABLES/141.jpg",
                      @"http://img.juimg.com/tuku/yulantu/130513/240422-130513064P438.jpg"
                      ];
    /**模拟网络延时情景**/
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, CGwidth, screen_height/2+30) imageURLStringsGroup:_scrollImages];
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.delegate = self;
    
    cycleScrollView2.hidesForSinglePage = YES;
    cycleScrollView2.autoScroll = NO;
    /**当前pagecontroller小圆点的颜色**/
    cycleScrollView2.currentPageDotColor = RGB(64, 186, 64);
    /**设置占位图**/
    cycleScrollView2.placeholderImage = [UIImage imageNamed:@"轮播占位图"];
    /**设置pagecontroller所在位置**/
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    /**pagecontroller显示样式**/
    cycleScrollView2.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    return cycleScrollView2;
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

#pragma mark --加入购物车
- (void)addShopCarClick
{
    NSLog(@"你添加到了购物车");
    self.buyView=[BuyPushView getPushBuyViewWithView:self.view];
    [self addbuyviewcontroller];
    _touchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _touchButton.backgroundColor = [UIColor blackColor];
    [_touchButton setFrame:CGRectMake(0, 0, CGwidth, CGHeight / 3)];
    _touchButton.alpha = 0.7;
    [_touchButton addTarget:self action:@selector(disAppearBuyViewClick) forControlEvents:UIControlEventTouchUpInside];
    self.tabBarController.tabBar.hidden = YES;

    [UIView animateWithDuration:.1 // 动画时长
                     animations:^{
                         [self.buyView setFrame:CGRectMake(0, CGHeight / 3, CGwidth, CGHeight)];
                     }
                     completion:^(BOOL finished) {
                         [self.view addSubview:_touchButton];
                     }];
    
    [self.view addSubview:self.buyView];
    


}

- (void)addbuyviewcontroller
{
    self.buyView.buyNumField.delegate=self;
    self.buyView.buyNumField.text=[NSString stringWithFormat:@"%d",self.goodsNum];
    [self.buyView.dismissButton addTarget:self action:@selector(disAppearBuyViewClick) forControlEvents:UIControlEventTouchUpInside];
    /**跳转**/
    [self.buyView.sureButton addTarget:self action:@selector(sureButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.buyView.addButton addTarget:self action:@selector(addBtnViewClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.buyView.reduceButton addTarget:self action:@selector(reduceGoodsNumClick:) forControlEvents:UIControlEventTouchUpInside];


}

#pragma mark --使buyview退出
- (void)disAppearBuyViewClick
{
    NSLog(@"退出");
    self.tabBarController.tabBar.hidden=YES;
     [_touchButton removeFromSuperview];
    [UIView animateWithDuration:.1 // 动画时长
                     animations:^{
                         [self.buyView setFrame:CGRectMake(0, screen_height, screen_width, screen_height)];
                     }];
    NSLog(@"---%@", self.buyView.buyNumField.text);

}
- (BOOL)textFieldShouldBeginEditing:(UITextView *)textView{
    NSLog(@"开始编辑");
    _touchButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_touchButton2];
    [_touchButton2 addTarget:self action:@selector(disMissKeyBoard:) forControlEvents:UIControlEventTouchUpInside];
    
    [UIView animateWithDuration:.1 animations:^{
        [_touchButton2 setFrame:CGRectMake(0, 0, CGwidth, CGHeight - 264)];
        [_touchButton setFrame:CGRectMake(0, 0, CGwidth, CGHeight / 3 - 60)];
        [self.buyView setFrame:CGRectMake(0, CGHeight / 3 - 60, CGwidth, CGHeight)];
    }];
    return YES;
}

#pragma mark --设置键盘收回
- (void)disMissKeyBoard:(UIButton *)sender
{
    _goodsNum = (int)self.buyView.buyNumField.text;
    [_touchButton2 removeFromSuperview];
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    [UIView animateWithDuration:.1 animations:^{
        [_touchButton setFrame:CGRectMake(0, 0, CGwidth, CGHeight / 3)];
        [self.buyView setFrame:CGRectMake(0, CGHeight / 3, CGwidth, CGHeight)];
    }];
    NSLog(@"---%@", self.buyView.buyNumField.text);
}


#pragma mark -改变购买数量的方法
- (void)addBtnViewClick:(UIButton *)sender
{
    NSLog(@"数量加一");
    _goodsNum++;
    self.buyView.buyNumField.text = [NSString stringWithFormat:@"%d", _goodsNum];
}
- (void)reduceGoodsNumClick:(UIButton *)sender
{
    NSLog(@"数量减一");
    if (_goodsNum > 1) {
        _goodsNum--;
        self.buyView.buyNumField.text = [NSString stringWithFormat:@"%d", _goodsNum];
    }
}

#pragma mark --点击确定跳转
- (void)sureButtonClick
{
    [self disAppearBuyViewClick];
    NSLog(@"+++++===%@", self.buyView.buyNumField.text);
    NSLog(@"加入购物车");
    
    LFHSureOrderPage *sureOrderPageCtrl=[[LFHSureOrderPage alloc] init];
    [self.navigationController pushViewController:sureOrderPageCtrl animated:YES];
    
    
}

#pragma mark --立即开抢



#pragma mark --创建表格
- (void)setTableView
{
    self.baseTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height)];
    self.baseTableView.dataSource=self;
    self.baseTableView.delegate=self;
    
    [self.view addSubview:self.baseTableView];

}

#pragma mark --实现代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
   
}

#pragma mark --头视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section==0)
    {
        return screen_height/2+30;
    
    }
    return 1;

}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * headerView = [[UIView alloc] init];
        if (section == 0) {
            SDCycleScrollView* cycleView = [self addScrollView];
            [headerView addSubview:cycleView];
            return headerView;
        }
    return headerView;

}

#pragma mark --尾视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 3;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footer=[[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 3)];
    footer.backgroundColor=RGB(235, 235, 235);

    return footer;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        static NSString *cell=@"redAndYellowCell";
        UITableViewCell *RandY=[tableView dequeueReusableCellWithIdentifier:cell];
        if(!RandY)
        {
            RandY=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell];
    
        }
        
        UIImageView *redImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screen_width/2, 60)];
        redImage.image=[UIImage imageNamed:@"ms-1"];
        [RandY addSubview:redImage];
        UILabel *whiteLable=[[UILabel alloc] initWithFrame:CGRectMake(10, 5, 50, 40)];
        whiteLable.text=@"¥1";
        whiteLable.textColor=[UIColor whiteColor];
        whiteLable.font=[UIFont boldSystemFontOfSize:22];
        [redImage addSubview:whiteLable];
        
        UILabel *oldPrice=[[UILabel alloc] init];
        oldPrice.font=[UIFont systemFontOfSize:12];
        oldPrice.textColor=[UIColor whiteColor];
        oldPrice.text=@"¥30.00";
        [redImage addSubview:oldPrice];
        [oldPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(redImage).with.offset(-40);
            make.bottom.mas_equalTo(redImage).with.offset(-10);
            make.height.equalTo(@20);
            
        }];
        
        UIImageView *yellowImage=[[UIImageView alloc] initWithFrame:CGRectMake(screen_width/2, 0, screen_width/2, 60)];
        yellowImage.image=[UIImage imageNamed:@"ms-2"];
        [RandY addSubview:yellowImage];
        
        UIImageView *timeImages=[[UIImageView alloc] init];
        timeImages.image=[UIImage imageNamed:@"图标-19"];
        [yellowImage addSubview:timeImages];
        [timeImages mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(yellowImage).with.offset(0);
            make.bottom.mas_equalTo(yellowImage).with.offset(-10);
            make.height.equalTo(@20);
            make.width.equalTo(@20);
        }];
        
        UILabel * redLables=[[UILabel alloc] init];
        redLables.text=@"距离结束时间仅剩";
        redLables.font=[UIFont systemFontOfSize:12];
        redLables.textColor=RGB(213, 0, 39);
        redLables.frame=CGRectMake(yellowImage.frame.size.width/2-50, 0, screen_width/2, 30);
        [yellowImage addSubview:redLables];
        
        UILabel *timeLable=[[UILabel alloc] init];
        timeLable.text=self.rushGoodsListItem.timeLable.text;
        timeLable.font=[UIFont boldSystemFontOfSize:17];
        timeLable.textColor=RGB(213, 0, 39);
        [yellowImage addSubview:timeLable];
        [timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(timeImages).with.offset(20);
            make.bottom.mas_equalTo(yellowImage).with.offset(-5);
            make.right.mas_equalTo(yellowImage).with.offset(-5);
        }];
        
        return RandY;

        
    
    }else if (indexPath.section==1)
    {
        
        static NSString *cells=@"aCell";
        UITableViewCell *numCell=[tableView dequeueReusableCellWithIdentifier:cells];
        
        if(!numCell)
        {
            numCell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cells];
        }
        
        UILabel *nameLable=[[UILabel alloc] init];
        nameLable.text=@"毛豆";
        nameLable.textColor=RGB(64, 186, 64);
        nameLable.font=[UIFont systemFontOfSize:16];
        nameLable.frame=CGRectMake(10, 5, screen_width/2, 30);
        [numCell addSubview:nameLable];
        
        UILabel *rushNum=[[UILabel alloc] init];
        rushNum.text=@"抢购件数：";
        rushNum.textColor=RGB(113, 113, 113);
        rushNum.font=[UIFont systemFontOfSize:11];
        [numCell addSubview:rushNum];
        [rushNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(numCell).with.offset(10);
            make.bottom.mas_equalTo(numCell).with.offset(-5);
            make.right.mas_equalTo(numCell).with.offset(-screen_width/2+30);
            
        }];
        
        /**件数**/
        UILabel *numLab=[[UILabel alloc] init];
        numLab.text=@"5件";
        numLab.textColor=RGB(113, 113, 113);
        numLab.font=[UIFont systemFontOfSize:11];
        [numCell addSubview:numLab];
        [numLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(numCell).with.offset(-screen_width/2+30+15);
            make.bottom.mas_equalTo(numCell).with.offset(-5);
            make.top.mas_equalTo(numCell).with.offset(10);
            
        }];
        
        UILabel *isNomail=[[UILabel alloc] init];
        isNomail.text=@"免邮";
        isNomail.textColor=RGB(113, 113, 113);
        isNomail.font=[UIFont systemFontOfSize:11];
        [numCell addSubview:isNomail];
        [isNomail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(numCell).with.offset(-10);
            make.bottom.mas_equalTo(numCell).with.offset(-5);
            make.top.mas_equalTo(numCell).with.offset(10);
        }];
        
        return numCell;

           }else if(indexPath.section==2)
           {
               static NSString *guigeCell=@"guigecell";
               UITableViewCell *GUIGECELL=[tableView dequeueReusableCellWithIdentifier:guigeCell];
               if(!GUIGECELL)
               {
                   GUIGECELL=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:guigeCell];
                   
               }
               UILabel *guigelab=[[UILabel alloc] init];
               guigelab.text=@"规格：";
               guigelab.textColor=RGB(93, 89, 86);
               guigelab.font=[UIFont systemFontOfSize:12];
               [GUIGECELL addSubview:guigelab];
               [guigelab mas_makeConstraints:^(MASConstraintMaker *make) {
                   make.left.mas_equalTo(GUIGECELL).with.offset(10);
                   make.top.mas_equalTo(GUIGECELL).with.offset(10);
                   make.bottom.mas_equalTo(GUIGECELL).with.offset(-10);
                   
               }];
               
               UILabel *numKG=[[UILabel alloc] init];
               numKG.text=@"1kg";
               numKG.textColor=RGB(93, 89, 86);
               numKG.font=[UIFont systemFontOfSize:12];
               [GUIGECELL addSubview:numKG];
               [numKG mas_makeConstraints:^(MASConstraintMaker *make) {
                   make.left.mas_equalTo(guigelab).with.offset(30);
                   make.top.mas_equalTo(GUIGECELL).with.offset(10);
                   make.bottom.mas_equalTo(GUIGECELL).with.offset(-10);
               }];
               
               return GUIGECELL;
               

           }else
           {
           
               static NSString *DetailCell=@"DetailCell";
               UITableViewCell *DetailCELL=[tableView dequeueReusableCellWithIdentifier:DetailCell];
               if(!DetailCELL)
               {
                   DetailCELL=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DetailCell];
                   
               }
               TextView *detailView=[TextView makeNewCoreTextViewWithImageNum:5 withView:self.view];
               detailView.frame=CGRectMake(0, 0, screen_width, screen_height);
               [DetailCELL addSubview:detailView];
           
               return DetailCELL;
           
           
           }
    

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        return 60;
    }else if (indexPath.section==1)
    {
        return 50.0;
    }else if (indexPath.section==2)
    {
        return 35.0;
    }else
    {
        
        return screen_height;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
