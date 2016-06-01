//
//  LFHSegmentedControl.h
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/1.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <UIKit/UIKit.h>
/**定义选择代理**/
@protocol LFHSegmentedControlDelegate <NSObject>

@optional
- (void)segMentSelectedChange:(NSInteger)selection;

@end
@interface LFHSegmentedControl : UIView

@property(assign,nonatomic)id <LFHSegmentedControlDelegate>delegate;

@property(strong,nonatomic)NSMutableArray *btnTitleSource;
@property(strong,nonatomic)UIColor *titleColor;
@property(strong,nonatomic)UIColor *selectColor;
@property(strong,nonatomic)UIFont *titleFont;
@property(strong,nonatomic)UIColor *buttonDownColor;
@property(strong,nonatomic)UILabel *lineLab;

+ (LFHSegmentedControl *)segmentedControlFrame:(CGRect)frame titleDataSource:(NSArray *)titleDataSouece backgroundColor:(UIColor *)backgroundColor titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont selectColor:(UIColor *)selectColor buttonDownColor:(UIColor *)buttonDownColor  Delegate:(id)delegate;

@end
