//
//  GoodsListItem.h
//  LoveFlyHome
//
//  Created by gpf on 16/5/30.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsListItem : UICollectionViewCell
@property (nonatomic, strong) UIImageView *goodsImage;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong)  UILabel *priceLabel;
+ (instancetype)GoodsCollectionItem:(UICollectionView *)collectionView withIndex:(NSIndexPath *)index;

@end
