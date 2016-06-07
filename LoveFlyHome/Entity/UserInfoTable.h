//
//  UserInfoTable.h
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/7.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoTable : NSObject
@property(nonatomic,assign)NSInteger UserID;
@property(nonatomic,strong)NSString *UserName,*UserImage,*UserGender,*UserBirthday,*UserShoppingAddress,*UserTelephone,*UserPassword;
@end
