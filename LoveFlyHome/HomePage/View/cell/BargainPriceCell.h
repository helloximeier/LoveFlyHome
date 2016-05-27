//
//  BargainPriceCell.h
//  LoveFlyHome
//
//  Created by Lefeng on 16/5/27.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BargainPriceDelgate<NSObject>
@optional
- (void)didselectBargainIndex:(NSInteger)index;
@end
@interface BargainPriceCell : UITableViewCell

@property(strong,nonatomic)NSMutableArray *BargainArray;
@property(assign,nonatomic)id<BargainPriceDelgate>delgate;
@end
