//
//  LFHSpecialCell.h
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/4.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFHSpecialCell : UICollectionViewCell
@property(strong,nonatomic)UIImageView *specialGoodsImage;
@property(strong,nonatomic)UILabel *specialGoodsName;
@property(strong,nonatomic)UIButton *imageBtn;
@property(strong,nonatomic)UILabel *specialLable;
+ (instancetype)SpecialGoodsCollectionItem:(UICollectionView *)collection withIndex:(NSIndexPath *)index;
@end
