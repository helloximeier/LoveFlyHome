//
//  FLHomeSearchBar.h
//  LoveFlyHome
//
//  Created by eclectic on 16/5/30.
//  Copyright © 2016年 ispoc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLHomeSearchBar : UISearchBar

@property (nonatomic, copy) void (^searchBarShouldBeginEditingBlocl)();
@property (nonatomic, copy) void (^searchBarTextDidChangedBlock)();
@property (nonatomic, copy) void (^searchBarDidSearchBlock)();


+ (FLHomeSearchBar *)searchBarWithPlaceHolder:(NSString *)placeholder;

@end
