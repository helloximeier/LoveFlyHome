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
@interface LFHRushBuyControl ()<UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic)UITableView *rushBuyTabView;
@end

@implementation LFHRushBuyControl

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
    
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
    return 6;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
   
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
    }else
    {
        static NSString *cells=@"aCell";
        UITableViewCell *numCell=[tableView dequeueReusableCellWithIdentifier:cells];
        numCell.backgroundColor=[UIColor redColor];
        if(numCell==nil)
        {
            numCell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cells];
        }
        UILabel *nameLable=[[UILabel alloc] init];
        nameLable.text=@"毛豆";
        nameLable.textColor=RGB(64, 186, 64);
        nameLable.font=[UIFont systemFontOfSize:14];
        [numCell addSubview:nameLable];
        [numCell mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(numCell).with.offset(5);
            make.top.mas_equalTo(numCell).with.offset(0);
            make.height.equalTo(@30);
        }];
        return numCell;
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
