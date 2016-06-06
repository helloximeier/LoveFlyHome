//
//  GoodsInfo.h
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/6.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsInfo : NSObject
@property(assign,nonatomic)NSInteger GoodsID;
@property(copy,nonatomic)NSString *GoodsName,*GoodsImage,*GoodsPrice,*GoodsWeight,*GoodsNums;
@end
