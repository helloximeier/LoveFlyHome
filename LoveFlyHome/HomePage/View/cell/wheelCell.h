//
//  wheelCell.h
//  ljzy
//
//  Created by 皇朝 on 16/4/15.
//  Copyright © 2016年 皇朝. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WheelImageView.h"
@interface wheelCell : UITableViewCell
@property(strong,nonatomic)WheelImageView *wheelView;
@property(strong,nonatomic)NSMutableArray *menuarry;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;


@end
