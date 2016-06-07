//
//  DBHelper.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/6.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "DBHelper.h"
#import <FMDB.h>
#import "GoodsInfo.h"
#import "UserInfoTable.h"
#define DB @"MallDB.sqlite3"
static FMDatabase *database=nil;

@implementation DBHelper

#pragma mark --判断路径是否存在
- (id)init
{
    self=[super init];
    if(self)
    {
        /**创建文件管理器**/
        NSFileManager *fm=[NSFileManager defaultManager];
        /**路径**/
        NSString *path1=[self boundlePath];
        NSString *path2=[self documentPath];
        
        /**判断指定路径是否存在**/
        if(![fm fileExistsAtPath:path2])
        {
            /**如果不存在  复制**/
            [fm copyItemAtPath:path1 toPath:path2 error:nil];
        
        }
        
        /**创建数据库**/
        if(!database)
        {
            database=[FMDatabase databaseWithPath:path2];
        }
    
    }
    return self;
}

#pragma mark --获取sql的文件路径
- (NSString *)boundlePath
{
    NSString *path=[[NSBundle mainBundle] pathForResource:DB ofType:@""];
    return path;
}

#pragma mark --获取沙盒下document的路径
- (NSString *)documentPath
{
    NSString *documentPath=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:DB];
    return documentPath;

}

#pragma mark --执行增删改  非查询语句
- (BOOL)exceSql:(NSString *)sql
{
    BOOL flag=NO;
    if([database open])
    {
        flag=[database executeUpdate:sql];
        
        /**关闭数据库**/
        [database close];
    }
    return flag;

}
#pragma mark --查询表里所有数据
- (NSArray *)getGoodsInfo:(NSString *)sql
{
    NSMutableArray *arrayGoods=nil;
    /**打开数据库**/
    if([database open])
    {
        FMResultSet *results=[database executeQuery:sql];
        /**返回一行数据 自行进入下一行**/
        while ([results next]) {
            if(!arrayGoods)
            {
                arrayGoods=[[NSMutableArray alloc]initWithCapacity:0];
            
            }
            GoodsInfo *goods=[[GoodsInfo alloc] init];
            goods.GoodsID=[results intForColumn:@"GoodsID"];
            goods.GoodsName=[results stringForColumn:@"GoodsName"];
            goods.GoodsImage=[results stringForColumn:@"GoodsImage"];
            goods.GoodsPrice=[results stringForColumn:@"GoodsPrice"];
            goods.GoodsWeight=[results stringForColumn:@"GoodsWeight"];
            goods.GoodsNums=[results stringForColumn:@"GoodsNums"];
            
            [arrayGoods addObject:goods];
        }
        
        /**关闭数据库**/
        [database close];
    
    }else
    {
        NSLog(@"数据库打开失败");
    }
    return arrayGoods;

}

#pragma mark --执行单行查询
- (GoodsInfo *)getGoodsInfoById:(NSString *)sql
{
    GoodsInfo *goods=nil;
    if([database open])
    {
        FMResultSet *results=[database executeQuery:sql];
        if([results next])
        {
            goods=[[GoodsInfo alloc] init];
            goods.GoodsID=[results intForColumn:@"GoodsID"];
            goods.GoodsName=[results stringForColumn:@"GoodsName"];
            goods.GoodsImage=[results stringForColumn:@"GoodsImage"];
            goods.GoodsPrice=[results stringForColumn:@"GoodsPrice"];
            goods.GoodsWeight=[results stringForColumn:@"GoodsWeight"];
            goods.GoodsNums=[results stringForColumn:@"GoodsNums"];

        }
        
        [database close];
    
    }else
    {
        NSLog(@"数据库打开失败");
    
    }

    return goods;

}
#pragma mark --查询用户表带数据
- (NSArray *)getUserInfo:(NSString *)sql
{
    NSMutableArray *arrayUsers=nil;
    /**打开数据库**/
    if([database open])
    {
        FMResultSet *results=[database executeQuery:sql];
        /**返回一行数据 自行进入下一行**/
        while ([results next]) {
            if(!arrayUsers)
            {
                arrayUsers=[[NSMutableArray alloc]initWithCapacity:0];
                
            }
            UserInfoTable *user=[[UserInfoTable alloc] init];
            user.UserID=[results intForColumn:@"UserID"];
            user.UserName=[results stringForColumn:@"UserName"];
            user.UserImage=[results stringForColumn:@"UserImage"];
            user.UserGender=[results stringForColumn:@"UserGender"];
            user.UserBirthday=[results stringForColumn:@"UserBirthday"];
            user.UserShoppingAddress=[results stringForColumn:@"UserShoppingAddress"];
            user.UserTelephone=[results stringForColumn:@"UserTelephone"];
            user.UserPassword=[results stringForColumn:@"UserPassword"];
            [arrayUsers addObject:user];
        }
        
        /**关闭数据库**/
        [database close];
        
    }else
    {
        NSLog(@"数据库打开失败");
    }
    return arrayUsers;
    
}

#pragma mark --查询单条用户信息
- (UserInfoTable *)getUserInfoById:(NSString *)sql
{
    UserInfoTable *users=nil;
    if([database open])
    {
        FMResultSet *results=[database executeQuery:sql];
        if([results next])
        {
            users=[[UserInfoTable alloc] init];
            users.UserID=[results intForColumn:@"UserID"];
            users.UserName=[results stringForColumn:@"UserName"];
            users.UserImage=[results stringForColumn:@"UserImage"];
            users.UserGender=[results stringForColumn:@"UserGender"];
            users.UserBirthday=[results stringForColumn:@"UserBirthday"];
            users.UserShoppingAddress=[results stringForColumn:@"UserShoppingAddress"];
            users.UserTelephone=[results stringForColumn:@"UserTelephone"];
            users.UserPassword=[results stringForColumn:@"UserPassword"];
            
        }
        
        [database close];
        
    }else
    {
        NSLog(@"数据库打开失败");
        
    }
    
    return users;
    
}

@end
