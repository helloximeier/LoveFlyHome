//
//  LFHPickerChoiceView.h
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/3.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LFHPickerDelegate <NSObject>

@optional;
- (void)PickerSelectorIndixString:(NSString *)str;

@end
@interface LFHPickerChoiceView : UIView

@property (nonatomic, strong) NSArray *customArr;

@property (nonatomic,strong)UILabel *selectLb;

@property (nonatomic,assign)id<LFHPickerDelegate>delegate;

@end
