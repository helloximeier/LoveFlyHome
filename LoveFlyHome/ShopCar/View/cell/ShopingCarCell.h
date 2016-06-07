//
//  ShopingCarCell.h
//  LoveFlyHome
//
//  Created by gpf on 16/5/31.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopingCarCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *productImageButton;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UIButton *reduceButton;
@property (weak, nonatomic) IBOutlet UITextField *productTextField;

@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@property (assign,nonatomic) NSInteger goodsId;


@end
