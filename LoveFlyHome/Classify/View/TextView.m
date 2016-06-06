//
//  TextView.m
//  图文混排
//
//  Created by gpf on 16/6/3.
//  Copyright © 2016年 gpf. All rights reserved.
//

#import "TextView.h"

@interface TextView ()


@end


@implementation TextView

+ (instancetype)makeNewCoreTextViewWithImageNum:(int)num withView:(UIView *)view{
    TextView * textView = [[TextView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, num * 200 + 21)];
    if (!textView) {
        textView = [[TextView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, num * 200 + 21)];
    }
    [textView addTextDataWithNum:num withView:view];
    return textView;
}

- (void)addTextDataWithNum:(int)num withView:(UIView *)view{
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, view.frame.size.width - 30, 21)];
//    _titleLabel.backgroundColor = [UIColor blueColor];
    _titleLabel.text = @"图文详情";
    [_titleLabel setFont:[UIFont fontWithName:@"HeitiSC" size:20.f]];
    [self addSubview:_titleLabel];
    
    _labelHeight = [TextView getLabelHeight];
    _controlText = [[UILabel alloc] initWithFrame:CGRectMake(15, 26, [[UIScreen mainScreen] bounds].size.width - 30, _labelHeight)];
     _controlText.numberOfLines = 0;
    
//    NSString * str = @"6月2日，南充8岁半小女生破格就读成外实验班的消息见诸报端后，这位成外历史上迄今最小的初一学生引起了社会的极大关注。有惊讶点赞的家长，渴望向小女生的妈妈取经；也有将信将疑者，质疑智商144的小涵宇，是否会小时了了大未必佳……总之，社会对于天才儿童有一种探秘的热切";
//    
//    
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:_controlText.text];;
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
//    [paragraphStyle setLineSpacing:5];
//    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, _controlText.text.length)];
//    _controlText.attributedText = attributedString;
//    //调节高度
//    CGSize size = CGSizeMake([[UIScreen mainScreen] bounds].size.width - 30, 500000);
//    CGSize labelSize = [_controlText sizeThatFits:size];
    
    
    
    
    [_controlText setFont:[UIFont fontWithName:@"SimSun" size:18.0f]];
    _controlText.text = @"6月2日，南充8岁半小女生破格就读成外实验班的消息见诸报端后，这位成外历史上迄今最小的初一学生引起了社会的极大关注。有惊讶点赞的家长，渴望向小女生的妈妈取经；也有将信将疑者，质疑智商144的小涵宇，是否会小时了了大未必佳……总之，社会对于天才儿童有一种探秘的热切";
    [self addSubview:_controlText];
    
    for (int i = 0; i < num; i++) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 26 + i * 200 + _labelHeight, view.frame.size.width - 30, 200)];
//        _imageView.backgroundColor = [UIColor redColor];
        _imageView.image=[UIImage imageNamed:@"tupianxiangqing.jpg"];
        [self addSubview:_imageView];
    }
}

+ (CGFloat)getLabelHeight
{
    NSString * str = @"6月2日，南充8岁半小女生破格就读成外实验班的消息见诸报端后，这位成外历史上迄今最小的初一学生引起了社会的极大关注。有惊讶点赞的家长，渴望向小女生的妈妈取经；也有将信将疑者，质疑智商144的小涵宇，是否会小时了了大未必佳……总之，社会对于天才儿童有一种探秘的热切";
    CGRect rect = [str boundingRectWithSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width - 30, 0) options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18.0f]} context:nil];
    return  rect.size.height;
}






@end
