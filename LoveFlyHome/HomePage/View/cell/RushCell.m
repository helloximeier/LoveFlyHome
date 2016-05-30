//
//  RushCell.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/5/27.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "RushCell.h"
#import "Public.h"
#import "UIImageView+WebCache.h"
@interface RushCell()
{
    dispatch_source_t _timer;

}
@property(strong,nonatomic)UILabel *hoursLable;
@property(strong,nonatomic)UILabel *minuteLable;
@property(strong,nonatomic)UILabel *secondLable;
@end
@implementation RushCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        /**抢购排列  背景view**/
        for (int i=0; i<3; ++i) {
            UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OntagGestureView:)];
            UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(i*screen_width/3, 40, (screen_width-3)/3, 80)];
            backView.tag = 100+i;
            [backView addGestureRecognizer:tap];
            [self addSubview:backView];
            /**产品图片**/
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (screen_width-1)/3, 60)];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            imageView.tag = i+20;
            imageView.image=[UIImage imageNamed:@"bean.jpg"];
            [backView addSubview:imageView];

            
            /**产品名称**/
            UILabel *nameLab = [[UILabel alloc] initWithFrame:CGRectMake(25, 50, backView.frame.size.width/2, 30)];
            nameLab.tag = 50+i;
            nameLab.textColor = [UIColor blackColor];
            nameLab.text=@"毛豆";
            nameLab.textAlignment = NSTextAlignmentCenter;
       
            [backView addSubview:nameLab];
            
            //名店抢购图
            UIImageView *mingdian = [[UIImageView alloc] initWithFrame:CGRectMake(screen_width/2-100, 7, 200, 35)];
            [mingdian setImage:[UIImage imageNamed:@"图标-59"]];
            [self addSubview:mingdian];
            
           
            /**倒计时**/
            UIImageView *timeImageview=[[UIImageView alloc] initWithFrame:CGRectMake(10, 90, backView.frame.size.width/2+55, 30)];
            timeImageview.tag=70+i;
            [timeImageview setImage:[UIImage imageNamed:@"图标-61"]];
            [backView addSubview:timeImageview];
            
            /**时**/
            self.hoursLable=[[UILabel alloc] initWithFrame:CGRectMake(20, 0, 50, 30)];
            self.hoursLable.textColor=[UIColor whiteColor];
            self.hoursLable.font=[UIFont systemFontOfSize:12];
//            self.hoursLable.text=@"12小时";
            [timeImageview addSubview:self.hoursLable];
            
            /**分**/
            self.minuteLable=[[UILabel alloc] initWithFrame:CGRectMake(55, 0, 50, 30)];
            self.minuteLable.textColor=[UIColor whiteColor];
            self.minuteLable.font=[UIFont systemFontOfSize:12];
//            self.minuteLable.text=@"20分钟";
            [timeImageview addSubview:self.minuteLable];
            
            /**秒**/
            self.secondLable=[[UILabel alloc] initWithFrame:CGRectMake(80, 0, 50, 30)];
            self.secondLable.textColor=[UIColor whiteColor];
            self.secondLable.font=[UIFont systemFontOfSize:12];
//            self.secondLable.text=@"55秒";
            [timeImageview addSubview:self.secondLable];
            /**
             *调用倒计时方法
             **/
            [self getTimes];
            
        }
        
    
    
    }
    return self;

}


- (void)awakeFromNib {
    [super awakeFromNib];


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/**
 *获取当天的年月日的字符串
 *
 **/
- (NSString *)getyyyymmdd
{
    NSDate *now=[NSDate date];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    dateFormatter.dateFormat=@"yyyy-MM-dd";
    NSString *dayStr=[dateFormatter stringFromDate:now];
    return dayStr;


}

- (void)getTimes
{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *endDate=[dateFormatter dateFromString:[self getyyyymmdd]];
    NSDate *endDate_tomorrow = [[NSDate alloc] initWithTimeIntervalSinceReferenceDate:([endDate timeIntervalSinceReferenceDate] + 17*3600)];
    NSDate *starDate=[NSDate date];
    /**定时器**/
    NSTimeInterval timeInterval=[endDate_tomorrow timeIntervalSinceDate:starDate];
    if(_timer==nil)
    {
        __block int timeout = timeInterval; //倒计时时间
        if(timeout!=0)
        {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
            dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
            dispatch_source_set_event_handler(_timer, ^{
                /**倒计时结束  关闭**/
                if(timeout<=0)
                {
                    dispatch_source_cancel(_timer);
                    _timer=nil;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.hoursLable.text=@"00";
                        self.minuteLable.text=@"00";
                        self.secondLable.text=@"00";
                        
                    });
                }else
                {
                    int days = (int)(timeout/(3600*24));
                    int hours=(int)((timeout-days*24*3600)/3600);
                    int minute = (int)(timeout-days*24*3600-hours*3600)/60;
                    int second = timeout-days*24*3600-hours*3600-minute*60;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if(hours<10)
                        {
                            self.hoursLable.text=[NSString stringWithFormat:@"0%d小时",hours];
                        }else
                        {
                            self.hoursLable.text=[NSString stringWithFormat:@"%d小时",hours];
                        }
                        
                        if(minute<10)
                        {
                            self.minuteLable.text=[NSString stringWithFormat:@"0%d分",minute];
                        }else
                        {
                            self.minuteLable.text=[NSString stringWithFormat:@"%d分",minute];
                        }
                        
                        if(second<10)
                        {
                            self.secondLable.text=[NSString stringWithFormat:@"0%d秒",second];
                        }else
                        {
                       self.secondLable.text=[NSString stringWithFormat:@"0%d秒",second];
                        }
                    });
                    timeout--;

                
                }
            });
            dispatch_resume(_timer);
        }
    
    }


}


- (void)setRushData:(NSMutableArray *)rushData
{
    for(int i=0;i<3;i++)
    {
        
        RushDealsModel *rushDealModel=rushData[i];
        NSString *imageUrl=rushDealModel.imgUrl;
        NSString *nameUrl=rushDealModel.nameLabs;
        
        
        UIImageView *imageView=(UIImageView *)[self viewWithTag:20+i];
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil];
        UILabel *namelbs=(UILabel *)[self viewWithTag:50+i];
        namelbs.text=[NSString stringWithFormat:@"%@",nameUrl];

        
    }


}

- (void)OntagGestureView:(UITapGestureRecognizer *)sender{
    NSLog(@"tag:%ld",sender.view.tag);
    [self.delegate didSelectRushIndex:sender.view.tag];
}
@end
