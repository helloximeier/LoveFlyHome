//
//  RushCell.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/5/27.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "RushCell.h"
#import "Public.h"
#import "UIImageView+WebCache.h"
@implementation RushCell

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
            imageView.image=[UIImage imageNamed:@"bean.jpg"];
            [backView addSubview:imageView];

            
            /**产品名称**/
            UILabel *nameLab = [[UILabel alloc] initWithFrame:CGRectMake(25, 50, backView.frame.size.width/2, 30)];
            nameLab.tag = 50+i;
            nameLab.textColor = [UIColor blackColor];
            nameLab.text=@"毛豆";
            nameLab.textAlignment = NSTextAlignmentCenter;
       
            [backView addSubview:nameLab];
            //
            UILabel *timeLable = [[UILabel alloc] initWithFrame:CGRectMake(backView.frame.size.width/2+5, 50, backView.frame.size.width/2-5, 30)];
            timeLable.tag = 70+i;
            timeLable.textColor = navigationBarColor;
            timeLable.font = [UIFont systemFontOfSize:13];
            [backView addSubview:timeLable];
            
            //名店抢购图
            UIImageView *mingdian = [[UIImageView alloc] initWithFrame:CGRectMake(screen_width/2-100, 7, 200, 35)];
            [mingdian setImage:[UIImage imageNamed:@"图标-59"]];
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

    // Configure the view for the selected state
}

- (void)setRushData:(NSMutableArray *)rushData
{
    for(int i=0;i<3;i++)
    {
        
        RushDealsModel *rushDealModel=rushData[i];
        NSString *imageUrl=rushDealModel.imgUrl;
        NSString *nameUrl=rushDealModel.nameLabs;
        
        
        UIImageView *imageView=(UIImageView *)[self viewWithTag:20+i];
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil];
        UILabel *namelbs=(UILabel *)[self viewWithTag:50+i];
        namelbs.text=[NSString stringWithFormat:@"%@",nameUrl];

        
    }


}

- (void)OntagGestureView:(UITapGestureRecognizer *)sender{
    NSLog(@"tag:%ld",sender.view.tag);
    [self.delegate didSelectRushIndex:sender.view.tag];
}
@end
