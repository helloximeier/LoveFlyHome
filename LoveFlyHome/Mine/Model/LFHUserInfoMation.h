//
//  LFHUserInfoMation.h
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/1.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFHUserInfoMation : NSObject

+ (instancetype) shareUserInfo;
/**手机号**/
@property(nonatomic,strong)NSString *telPhone;
/**用户id**/
@property(strong,nonatomic)NSString *userId;
/**用户呢称**/
@property(strong,nonatomic)NSString *userName;
/**用户头像地址**/
@property(strong,nonatomic)NSString *userImageSrc;
/**性别**/
@property(strong,nonatomic)NSString *userGender;
/**生日**/
@property(strong,nonatomic)NSString *userBirthday;
/**收货地址**/
@property(strong,nonatomic)NSString *userAddress;

/**是否登录**/
@property(assign,nonatomic)BOOL isLogin;

+ (LFHUserInfoMation *)unarchiver;
- (void)archiver;
@end
