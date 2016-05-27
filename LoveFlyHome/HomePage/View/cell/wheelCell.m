//
//  wheelCell.m
//  ljzy
//
//  Created by 皇朝 on 16/4/15.
//  Copyright © 2016年 皇朝. All rights reserved.
//

#import "wheelCell.h"
#import "WheelImageView.h"
#define screen_width self.bounds.size.width
@interface wheelCell()

@end
@implementation wheelCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
    
        //    本地图片
        NSArray *arr1=@[[UIImage imageNamed:@"banner1@2x.png.png"],[UIImage imageNamed:@"banner2@2x.png.png"],[UIImage imageNamed:@"banner3@2x.png.png"],[UIImage imageNamed:@"banner1@2x.png.png"],[UIImage imageNamed:@"banner2@2x.png.png"]];
        //     创建方式
        
        self.wheelView=[[WheelImageView alloc] initWithImageArray:arr1];
        
      
        //    设置frame
        self.wheelView.frame=CGRectMake(0, 0, screen_width, 180);
   
        //    用block处理图片点击
        self.wheelView.imageClickBlock=^(NSInteger index)
        {
            NSLog(@"%ld",index);
            
        };
        
        //    设置每张图片的停留时间
        _wheelView.time=1;
        
        /**
         *
         *设置分页控件的frame
         **/
        CGFloat width=arr1.count*30;
        CGFloat height=20;
        CGFloat x=_wheelView.frame.size.width-width-10;
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
