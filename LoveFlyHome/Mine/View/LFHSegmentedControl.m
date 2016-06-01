//
//  LFHSegmentedControl.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/1.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHSegmentedControl.h"
@interface LFHSegmentedControl ()<LFHSegmentedControlDelegate>
{
    CGFloat widthFloat;
    UIView *buttonDownView;
    NSInteger selectSegument;
}
@end
@implementation LFHSegmentedControl
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self==[super initWithFrame:frame])
    {
        self.btnTitleSource=[NSMutableArray array];
        selectSegument=0;
    
    }
    return self;


}
+ (LFHSegmentedControl *)segmentedControlFrame:(CGRect)frame titleDataSource:(NSArray *)titleDataSouece backgroundColor:(UIColor *)backgroundColor titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont selectColor:(UIColor *)selectColor buttonDownColor:(UIColor *)buttonDownColor  Delegate:(id)delegate
{
    LFHSegmentedControl *segmentCtrl=[[self alloc] initWithFrame:frame];
    segmentCtrl.backgroundColor=backgroundColor;
    segmentCtrl.buttonDownColor=buttonDownColor;
    
    segmentCtrl.titleColor=titleColor;
    segmentCtrl.titleFont=titleFont;
    segmentCtrl.selectColor=selectColor;

    segmentCtrl.delegate=delegate;
    [segmentCtrl AddSegumentArray:titleDataSouece];
    
    return segmentCtrl;

}

- (void)AddSegumentArray:(NSArray *)segmentArray
{
    /**按钮的个数**/
    NSInteger segmentNumber=segmentArray.count;
    /**按钮的宽度**/
    widthFloat=(self.bounds.size.width)/segmentNumber;
    /**创建按钮**/
    for(int i=0;i<segmentArray.count;i++)
    {
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(i * widthFloat, 0, widthFloat, self.bounds.size.height - 2)];
        [btn setTitle:segmentArray[i] forState:UIControlStateNormal];
        [btn.titleLabel setFont:self.titleFont];
        [btn setTitleColor:self.titleColor forState:UIControlStateNormal];
        [btn setTitleColor:self.selectColor forState:UIControlStateSelected];
        btn.tag = i + 1;
        [btn addTarget:self action:@selector(changeSegumentAction:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            buttonDownView =[[UIView alloc]initWithFrame:CGRectMake(i * widthFloat, self.bounds.size.height - 2, widthFloat, 2)];
            [buttonDownView setBackgroundColor:self.buttonDownColor];
            
            [self addSubview:buttonDownView];
        }
        [self addSubview:btn];
        
        [self.btnTitleSource addObject:btn];
    }
    [[self.btnTitleSource firstObject] setSelected:YES];


}

- (void)changeSegumentAction:(UIButton *)btn{
    [self selectTheSegument:btn.tag - 1];
}

-(void)selectTheSegument:(NSInteger)segument{
    
    if (selectSegument != segument) {
        
        [self.btnTitleSource[selectSegument] setSelected:NO];
        [self.btnTitleSource[segument] setSelected:YES];
        
        [UIView animateWithDuration:0.2 animations:^{
            
            [buttonDownView setFrame:CGRectMake(segument * widthFloat,self.bounds.size.height - 2, widthFloat, 2)];
        }];
        selectSegument = segument;
        [self.delegate segMentSelectedChange:selectSegument];
    }
}

@end
