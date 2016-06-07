//
//  LFHUserInfoMation.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/1.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHUserInfoMation.h"

@implementation LFHUserInfoMation
+ (instancetype) shareUserInfo
{
    static LFHUserInfoMation *userInfo = nil;
    if (userInfo == nil) {
        userInfo = [[LFHUserInfoMation alloc]init];
        userInfo.isLogin = NO;
        userInfo.userId = @"";
      
    }
    return userInfo;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self=[super init];
    if(self)
    {
        self.userId=[coder decodeObjectForKey:@"userid"];
        self.userName=[coder decodeObjectForKey:@"username"];
        self.userImageSrc=[coder decodeObjectForKey:@"userImg"];
        self.userGender=[coder decodeObjectForKey:@"sex"];
        self.isLogin=[coder decodeObjectForKey:@"isLogin"];
        self.telPhone=[coder decodeObjectForKey:@"telPhone"];
        self.userBirthday=[coder decodeObjectForKey:@"userbirthday"];
        self.userAddress=[coder decodeObjectForKey:@"userAddress"];
        
    }
    return self;

}



- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.userId forKey:@"userid"];
    [coder encodeObject:self.userName forKey:@"username"];
    [coder encodeObject:self.userImageSrc forKey:@"userImg"];
    [coder encodeObject:self.userGender forKey:@"sex"];
    [coder encodeObject:[NSNumber numberWithBool:self.isLogin] forKey:@"isLogin"];
    [coder encodeObject:self.telPhone forKey:@"telPhone"];
    [coder encodeObject:self.userBirthday forKey:@"userbirthday"];
    [coder encodeObject:self.userAddress forKey:@"userAddress"];


}

@end
