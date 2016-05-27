//
//  NetworkSingLenton.h
//  LoveFlyHome
//
//  Created by Lefeng on 16/5/27.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

#pragma mark -请求超时
#define TIMEOUT 30

typedef void(^SuccessBlock)(id responseBody);
typedef void(^FailureBlock)(NSString *error);
@interface NetworkSingLenton : NSObject


@end
