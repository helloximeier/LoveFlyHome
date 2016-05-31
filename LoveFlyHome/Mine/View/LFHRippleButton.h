//
//  LFHRippleButton.h
//  LoveFlyHome
//
//  Created by Lefeng on 16/5/31.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^completion)(BOOL success);

@interface LFHRippleButton : UIView
{
    @private
    UIImageView *imageView;
    UILabel *title;
    UITapGestureRecognizer *tapGesture;
    SEL methodName;
    id superSender;
    UIColor *rippleColor;
    NSArray *rippleColeors;
    BOOL isRippleOn;

}
@property(nonatomic,copy)completion block;
- (instancetype)initWithImage:(UIImage *)image andFrame:(CGRect)frame andTarget:(SEL)action andID:(id)sender;
- (instancetype)initWithImage:(UIImage *)image andFrame:(CGRect)frame onCompletion:(completion)completionBlock;
- (void)setRippleEffectWithColor:(UIColor *)color;
- (void)setRippleEffectEnabled:(BOOL)setRippeEffectEnabled;
@end
