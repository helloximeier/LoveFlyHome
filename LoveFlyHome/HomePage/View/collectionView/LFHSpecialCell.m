//
//  LFHSpecialCell.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/4.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHSpecialCell.h"
#import "Masonry.h"
#import "Public.h"
#import "LFHSpecialViewController.h"

@implementation LFHSpecialCell
+ (instancetype)SpecialGoodsCollectionItem:(UICollectionView *)collection withIndex:(NSIndexPath *)index
{
    static NSString *ID=@"LFHSpecialCell";
    LFHSpecialCell *cell=[collection dequeueReusableCellWithReuseIdentifier:ID forIndexPath:index];
    if(cell==nil)
    {
        cell=[[self alloc] initWithStyle:UITableViewCellStyleSubtitle
                         reuseIdentifier:ID];
    }
    [cell setLFHControlFrame];
    cell.backgroundColor=[UIColor whiteColor];
    return cell;
    
    
    
    
}

- (void)setLFHControlFrame
{
    /**商品图片**/
    self.specialGoodsImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
    [self.specialGoodsImage setImage:[UIImage imageNamed:@"shengnvguo"]];
    [self addSubview:self.specialGoodsImage];
    
    /**名称**/
    self.specialGoodsName=[[UILabel alloc] initWithFrame:CGRectMake(5, self.frame.size.width+5, self.frame.size.width-10, 20)];
    self.specialGoodsName.text=@"圣女果";
    self.specialGoodsName.textAlignment=NSTextAlignmentCenter;
    [self addSubview:self.specialGoodsName];
    
    /**btn**/
    self.imageBtn=[[UIButton alloc] initWithFrame:CGRectMake(5, self.frame.size.width+10+15, self.frame.size.width-8, 25)];
    [self.imageBtn setImage:[UIImage imageNamed:@"tj-01"] forState:UIControlStateNormal];
    [self addSubview:self.imageBtn];
    
    self.specialLable=[UILabel new];
    self.specialLable.text=@"¥15.00";
    LFHSpecialViewController *specialView=[[LFHSpecialViewController alloc] init];
    specialView.priceLabelText=self.specialLable.text;
    NSLog(@"=----------%@",self.specialLable.text);
    NSLog(@"===-=-====%@",specialView.priceLabelText);
    self.specialLable.textColor=[UIColor whiteColor];
    [self.imageBtn addSubview:self.specialLable];
    [self.specialLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.imageBtn).with.offset(0);

        make.bottom.mas_equalTo(self.imageBtn).with.offset(-1);
        make.top.mas_equalTo(self.imageBtn).with.offset(5);
    }];

}


@end
