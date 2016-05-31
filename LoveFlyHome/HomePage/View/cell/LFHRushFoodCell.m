//
//  LFHRushFoodCell.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/5/31.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHRushFoodCell.h"

@implementation LFHRushFoodCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableview
{
    static NSString *identifier=@"rushCell";
    LFHRushFoodCell *cell=[tableview dequeueReusableCellWithIdentifier:identifier];
    if(cell==nil)
    {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"LFHRushFoodCell" owner:nil options:nil] firstObject];
    }
    return cell;

}
@end
