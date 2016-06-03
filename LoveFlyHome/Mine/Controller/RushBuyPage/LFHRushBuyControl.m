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
#import "LFHBottomBtnView.h"
@interface LFHRushBuyControl ()<UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic)UITableView *rushBuyTabView;
@property(strong,nonatomic)LFHBottomBtnView *bottomBtnView;
@end

@implementation LFHRushBuyControl

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
    [self initBottomBtnView];
    
}


#pragma mark --创建底部btn
- (void)initBottomBtnView
{
    self.bottomBtnView=[[LFHBottomBtnView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-64-60, screen_width, 60)];
    [self.view addSubview:self.bottomBtnView];
    
    /**加入购物车**/
    [self.bottomBtnView.btn_shopCar addTarget:self action:@selector(addShopCarClick) forControlEvents:UIControlEventTouchUpInside];
    /**立即开抢**/
    [self.bottomBtnView.btn_Rush addTarget:self action:@selector(RushClick) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark --加入购物车
- (void)addShopCarClick
{
    NSLog(@"你添加到了购物车");


}

#pragma mark --立即开抢
- (void)RushClick
{

    NSLog(@"你点击了开抢");

}

#pragma mark --创建表格
- (void)setTableView
{
    self.rushBuyTabView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height)];
    self.rushBuyTabView.dataSource=self;
    self.rushBuyTabView.delegate=self;
    
    [self.view addSubview:self.rushBuyTabView];

}

#pragma mark --实现代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
   
}

#pragma mark --头视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 3;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headrView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 3)];
    headrView.backgroundColor=RGB(234, 234, 234);
    
    return headrView;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        static NSString *Cell=@"wheelcell";
        wheelCell *cells=[tableView dequeueReusableCellWithIdentifier:Cell];
        if(!cells)
        {
            cells=[[wheelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cell];
        }
        
        return cells;
        
    
    }else if (indexPath.section==1)
    {
        static NSString *cell=@"redAndYellowCell";
        UITableViewCell *RandY=[tableView dequeueReusableCellWithIdentifier:cell];
        if(!RandY)
        {
            RandY=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell];
            
        
        }
        
        UIImageView *redImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screen_width/2, 50)];
        redImage.image=[UIImage imageNamed:@"ms-01.png"];
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
        
        UIImageView *yellowImage=[[UIImageView alloc] initWithFrame:CGRectMake(screen_width/2, 0, screen_width/2, 50)];
        yellowImage.image=[UIImage imageNamed:@"ms-02.png"];
        [RandY addSubview:yellowImage];
        
        UIImageView *timeImages=[[UIImageView alloc] init];
        timeImages.image=[UIImage imageNamed:@"图标-19.png"];
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
        timeLable.text=@"1小时2分30秒80";
        timeLable.font=[UIFont boldSystemFontOfSize:17];
        timeLable.textColor=RGB(213, 0, 39);
        [yellowImage addSubview:timeLable];
        [timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(timeImages).with.offset(20);
            make.bottom.mas_equalTo(yellowImage).with.offset(-5);
            make.right.mas_equalTo(yellowImage).with.offset(-5);
        }];

        return RandY;
    }else if(indexPath.section==2)
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
    }else
    {
        static NSString *guigeCell=@"guigecell";
        UITableViewCell *GUIGECELL=[tableView dequeueReusableCellWithIdentifier:guigeCell];
        if(!GUIGECELL)
        {
            GUIGECELL=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:guigeCell];
        
        }
        UILabel *guigelab=[[UILabel alloc] init];
        guigelab.text=@"规格";
        guigelab.textColor=RGB(93, 89, 86);
        guigelab.font=[UIFont systemFontOfSize:12];
        [GUIGECELL addSubview:guigelab];
        [guigelab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(GUIGECELL).with.offset(10);
            make.top.mas_equalTo(GUIGECELL).with.offset(5);
            
        }];
        
        UILabel *numKG=[[UILabel alloc] init];
        numKG.text=@"1kg";
        numKG.textColor=RGB(93, 89, 86);
        numKG.font=[UIFont systemFontOfSize:12];
        [GUIGECELL addSubview:numKG];
        [numKG mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(guigelab).with.offset(30);
            make.top.mas_equalTo(GUIGECELL).with.offset(5);
        }];
        
        return GUIGECELL;
    
    }
    

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        return screen_height/2-30;
    }else if (indexPath.section==1)
    {
        return 50.0;
    }else if (indexPath.section==2)
    {
        return 35.0;
    }else if (indexPath.section==3)
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
