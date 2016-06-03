//
//  TextView.h
//  图文混排
//
//  Created by gpf on 16/6/3.
//  Copyright © 2016年 gpf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextView : UIView
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * controlText;
@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, assign) CGFloat labelHeight;

+ (instancetype)makeNewCoreTextViewWithImageNum:(int)num withView:(UIView *)view;

@end
