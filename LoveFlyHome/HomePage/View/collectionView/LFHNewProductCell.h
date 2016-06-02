//
//  LFHNewProductCell.h
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/2.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFHNewProductCell : UICollectionViewCell

/**产品名称**/
@property(strong,nonatomic)UIImageView *newproductImage;
@property(strong,nonatomic)UILabel *newproductName;
@property(strong,nonatomic)UILabel *newsPrice;
@property(strong,nonatomic)UILabel *caichangjialab;
@property(strong,nonatomic)UILabel *oldfPrice;

+ (instancetype)NewProductGoodsCollectionItem:(UICollectionView *)collection withIndex:(NSIndexPath *)index;
@end
