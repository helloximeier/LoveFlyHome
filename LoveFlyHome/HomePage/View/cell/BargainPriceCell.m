//
//  BargainPriceCell.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/5/27.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "BargainPriceCell.h"
#import "Public.h"
@implementation BargainPriceCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        /**抢购排列  背景view**/
        for (int i=0; i<3; ++i) {
            UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OntagGestureView:)];
            UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(i*screen_width/3, 40, (screen_width-3)/3, 80)];
            backView.tag = 100+i;
            [backView addGestureRecognizer:tap];
            [self addSubview:backView];
            /**产品图片**/
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (screen_width-1)/3, 60)];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            imageView.tag = i+20;
            imageView.image=[UIImage imageNamed:@"shengnvguo.png"];
            [backView addSubview:imageView];
            
            
            /**产品名称**/
            UILabel *nameLab = [[UILabel alloc] initWithFrame:CGRectMake(25, 50, backView.frame.size.width/2, 30)];
            nameLab.tag = 50+i;
            nameLab.textColor = [UIColor blackColor];
            nameLab.text=@"圣女果";
            nameLab.textAlignment = NSTextAlignmentCenter;
            
            [backView addSubview:nameLab];
            
            //特价商品
            UIImageView *mingdian = [[UIImageView alloc] initWithFrame:CGRectMake(screen_width/2-100, 7, 200, 35)];
            [mingdian setImage:[UIImage imageNamed:@"图标-60"]];
            [self addSubview:mingdian];
        }

        }
        return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

  
}

@end
