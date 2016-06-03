//
//  LFHPickerChoiceView.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/3.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHPickerChoiceView.h"
#import "Masonry.h"
#import "Public.h"
@interface LFHPickerChoiceView()<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong)UIView *backgroundView;
@property(nonatomic,strong)UIButton *canceBtn;
@property(nonatomic,strong)UIButton *conpleteBtn;
@property(nonatomic,strong)UIPickerView *pickerView;
@property(nonatomic,strong)NSMutableArray *array;;
@end
@implementation LFHPickerChoiceView
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    if(self=[super initWithFrame:frame])
//    {
//        self.array=[NSMutableArray array];
//        self.frame=CGRectMake(0, 0, screen_width, screen_height);
//    
//    }
//
//
//}


@end
