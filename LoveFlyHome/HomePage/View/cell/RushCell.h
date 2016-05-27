//
//  RushCell.h
//  LoveFlyHome
//
//  Created by Lefeng on 16/5/27.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RushDealsModel.h"
@protocol RushDelegate<NSObject>

@optional
- (void)didSelectRushIndex:(NSInteger)index;
@end

@interface RushCell : UITableViewCell

@property(strong,nonatomic)NSMutableArray *rushData;

@property(assign,nonatomic) id<RushDelegate>delegate;
@end
