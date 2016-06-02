//
//  LFHRushGoodsListItem.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/2.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHRushGoodsListItem.h"

@implementation LFHRushGoodsListItem

+ (instancetype)RushGoodsCollectionItem:(UICollectionView *)collection withIndex:(NSIndexPath *)index
{
    static NSString *ID=@"LFHRushGoodsListItem";
    LFHRushGoodsListItem *cell=[collection dequeueReusableCellWithReuseIdentifier:ID forIndexPath:index];
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
    self.rushGoodsImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
    [self.rushGoodsImage setImage:[UIImage imageNamed:@"maodou"]];
    [self addSubview:self.rushGoodsImage];
    
    /**名称**/
    self.rushGoodsName=[[UILabel alloc] initWithFrame:CGRectMake(5, self.frame.size.width+5, self.frame.size.width-10, 20)];
    self.rushGoodsName.text=@"毛豆";
    [self addSubview:self.rushGoodsName];
    
    /**btn**/
    self.imageBtn=[[UIButton alloc] initWithFrame:CGRectMake(5, self.frame.size.width+10+20, self.frame.size.width-10, 20)];
    [self.imageBtn setImage:[UIImage imageNamed:@"time-red"] forState:UIControlStateNormal];
    [self addSubview:self.imageBtn];

}
@end
