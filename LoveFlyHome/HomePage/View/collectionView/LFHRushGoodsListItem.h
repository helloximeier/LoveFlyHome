//
//  LFHRushGoodsListItem.h
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/2.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFHRushGoodsListItem : UICollectionViewCell
@property(strong,nonatomic)UIImageView *rushGoodsImage;
@property(strong,nonatomic)UILabel *rushGoodsName;
@property(strong,nonatomic)UIButton *imageBtn;

+ (instancetype)RushGoodsCollectionItem:(UICollectionView *)collection withIndex:(NSIndexPath *)index;
@end
