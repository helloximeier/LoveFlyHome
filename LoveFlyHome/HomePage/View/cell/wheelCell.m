//
//  HomePageCtrl.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/5/26.
//  Copyright © 2016年 Lefeng. All rights reserved.


#import "wheelCell.h"
#import "WheelImageView.h"
#define screen_width [UIScreen mainScreen].bounds.size.width
@interface wheelCell()

@end
@implementation wheelCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
    
        //    本地图片
        NSArray *arr1=@[[UIImage imageNamed:@"banner1.jpg"],[UIImage imageNamed:@"banner2.jpg"],[UIImage imageNamed:@"banner3.jpg"],[UIImage imageNamed:@"banner4.jpg"]];
        //     创建方式
        
        self.wheelView=[[WheelImageView alloc] initWithImageArray:arr1];
        
      
        //    设置frame
        self.wheelView.frame=CGRectMake(0, 0, screen_width, 180);
        
        //    设置每张图片的停留时间
        _wheelView.time=1;
        
        /**
         *
         *设置分页控件的frame
         **/
        CGFloat width=arr1.count*30;
        CGFloat height=20;
        CGFloat x=_wheelView.frame.size.width-width-100;
        CGFloat y=_wheelView.frame.size.height-20;
        _wheelView.pageControl.frame=CGRectMake(x, y, width, height);
        
        [self addSubview:_wheelView];

    }
    
    
    return self;



}
- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

             
}

@end
