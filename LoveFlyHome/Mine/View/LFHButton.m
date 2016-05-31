//
//  LFHButton.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/5/31.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHButton.h"
#import "Public.h"
@implementation LFHButton
- (void)LFHButtonontentWithImage:(NSString *)images Title:(NSString *)title width:(CGFloat)width height:(CGFloat)height
{
    UIImageView *_image=[[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 60, 60)];
    _image.image=[UIImage imageNamed:images];
    [self addSubview:_image];
    
    UILabel *_title=[[UILabel alloc] initWithFrame:CGRectMake(0, screen_height/8, width, 30)];
    _title.textAlignment = NSTextAlignmentCenter;
    _title.textColor=[UIColor blackColor];
    _title.font = [UIFont systemFontOfSize:14];
    _title.text=title;
    [self addSubview:_title];


}


@end
