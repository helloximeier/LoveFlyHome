//
//  GoodsListItem.m
//  LoveFlyHome
//
//  Created by gpf on 16/5/30.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "GoodsListItem.h"
#import "Header.h"

@implementation GoodsListItem
+ (instancetype)GoodsCollectionItem:(UICollectionView *)collectionView withIndex:(NSIndexPath *)index{
    static NSString *ID = @"GoodsListItem";
    GoodsListItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:index];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    [cell setControlFrame];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (void)setControlFrame{
    _goodsImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
    _goodsImage.backgroundColor = [UIColor greenColor];
    [self addSubview:_goodsImage];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, self.frame.size.width + 5, self.frame.size.width - 10, 20)];
    _titleLabel.text = @"香菇";
    [self addSubview:_titleLabel];
    
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, self.frame.size.width + 10 + 20, self.frame.size.width - 10, 20)];
    [_priceLabel setTextColor:[UIColor priceTitleColor]];
    _priceLabel.text = @"￥15.00";
    [_priceLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18.0f]];
    [self addSubview:_priceLabel];
}
@end
