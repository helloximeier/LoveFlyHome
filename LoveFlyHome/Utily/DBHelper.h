//
//  DBHelper.h
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/6.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GoodsInfo;
@class UserInfoTable;
@interface DBHelper : NSObject

#pragma mark --查询数据
- (NSArray *)getGoodsInfo:(NSString *)sql;

#pragma mark --执行goodsInfo单行查询
- (GoodsInfo *)getGoodsInfoById:(NSString *)sql;

#pragma mark --执行非查询语句
- (BOOL)exceSql:(NSString *)sql;

#pragma mark --查询用户表带数据
- (NSArray *)getUserInfo:(NSString *)sql;

#pragma mark --查询单条用户信息
- (UserInfoTable *)getUserInfoById:(NSString *)sql;

@end
