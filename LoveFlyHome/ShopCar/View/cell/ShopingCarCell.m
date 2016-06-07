//
//  ShopingCarCell.m
//  LoveFlyHome
//
//  Created by gpf on 16/5/31.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "ShopingCarCell.h"
#import "DBHelper.h"
#import "GoodsInfo.h"

@interface ShopingCarCell()
{
    DBHelper *_helper;
    GoodsInfo *_goodsInfo;

}

@end

@implementation ShopingCarCell

- (void)awakeFromNib {
    [super awakeFromNib];
    /**实例化数据库**/
    _helper=[[DBHelper alloc] init];
    
      
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
