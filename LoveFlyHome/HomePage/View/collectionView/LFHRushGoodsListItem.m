//
//  LFHRushGoodsListItem.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/2.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHRushGoodsListItem.h"
#import "Masonry.h"
@interface LFHRushGoodsListItem()
@property(assign,nonatomic)int a;
@end
@implementation LFHRushGoodsListItem

+ (instancetype)RushGoodsCollectionItem:(UICollectionView *)collection withIndex:(NSIndexPath *)index
{
    static NSString *ID=@"LFHRushGoodsListItem";
    LFHRushGoodsListItem *cell=[collection dequeueReusableCellWithReuseIdentifier:ID forIndexPath:index];
    if(cell==nil)
    {
        cell=[[self alloc] initWithStyle:UITableViewCellStyleSubtitle
              reuseIdentifier:ID];
    }
    [cell setLFHControlFrame];
    cell.backgroundColor=[UIColor whiteColor];
    return cell;




}

- (void)setLFHControlFrame
{
    /**商品图片**/
    self.rushGoodsImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
    [self.rushGoodsImage setImage:[UIImage imageNamed:@"maodou"]];
    [self addSubview:self.rushGoodsImage];
    
    /**名称**/
    self.rushGoodsName=[[UILabel alloc] initWithFrame:CGRectMake(5, self.frame.size.width+5, self.frame.size.width-10, 20)];
    self.rushGoodsName.text=@"毛豆";
    self.rushGoodsName.textAlignment=NSTextAlignmentCenter;
    [self addSubview:self.rushGoodsName];
    
    /**btn**/
    self.imageBtn=[[UIButton alloc] initWithFrame:CGRectMake(5, self.frame.size.width+10+20, self.frame.size.width-5, 20)];
    [self.imageBtn setImage:[UIImage imageNamed:@"time-red"] forState:UIControlStateNormal];
    [self addSubview:self.imageBtn];
    
    self.timeLable=[[UILabel alloc] initWithFrame:CGRectMake(15, 0, self.frame.size.width-10, 20)];
    self.timeLable.font=[UIFont systemFontOfSize:10];
    self.timeLable.textColor=[UIColor whiteColor];
    [self.imageBtn addSubview:self.timeLable];

    self.a=0;
    /**设置定时器**/
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(putOutTime) userInfo:nil repeats:YES];

}

- (void)putOutTime
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];

    /**设计时间格式**/
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    /**设置时间区时**/
    NSTimeZone *timeZone=[NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    
    /**现在时间**/
    NSDate *nowDate=[NSDate date];
    /**设置一个字符串的时间**/
    NSMutableString *dateString=[NSMutableString stringWithFormat:@"%ld",20160606211000];
    [dateString insertString:@"-" atIndex:4];
    [dateString insertString:@"-" atIndex:7];
    [dateString insertString:@" " atIndex:10];
    [dateString insertString:@":" atIndex:13];
    [dateString insertString:@":" atIndex:16];

    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    /**指定输出格式**/
    [dateformatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSDate *newDate=[dateformatter dateFromString:dateString];
    long dates=(long)[newDate timeIntervalSince1970]-[nowDate timeIntervalSince1970];
    
    NSString *dayStr=[NSString stringWithFormat:@"%d",(int)dates/86400];
    
    NSString *hourStr=[NSString stringWithFormat:@"%d",(int)(dates%86400)/3600];
    
    /**分**/
    NSString *minuteStr=[NSString stringWithFormat:@"%d",(int)(dates)%3600/60];
    
    /**秒**/
    NSString *secondStr=[NSString stringWithFormat:@"%d",(int)(dates)%60];
    
    self.timeLable.text=[NSString stringWithFormat:@"%@天%@小时%@分%@秒",dayStr,hourStr,minuteStr,secondStr];

}
@end
