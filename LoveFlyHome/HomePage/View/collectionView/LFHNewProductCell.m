//
//  LFHNewProductCell.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/2.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHNewProductCell.h"
#import "Public.h"

@implementation LFHNewProductCell
+ (instancetype)NewProductGoodsCollectionItem:(UICollectionView *)collection withIndex:(NSIndexPath *)index
{
    static NSString *newProductCell=@"LFHNewProductCell";
    LFHNewProductCell *cell=[collection dequeueReusableCellWithReuseIdentifier:newProductCell forIndexPath:index];
    if(cell==nil)
    {
        cell=[[self alloc] initWithStyle:UITableViewCellStyleSubtitle
                         reuseIdentifier:newProductCell];
    
    }
    [cell setNewProduceCtrlFrame];
    return cell;



}

- (void)setNewProduceCtrlFrame
{
    /**新品图片**/
    self.newproductImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
    [self.newproductImage setImage:[UIImage imageNamed:@"xihongshi"]];
    [self addSubview:self.newproductImage];
    
    /**新品名称**/
    self.newproductName=[[UILabel alloc] initWithFrame:CGRectMake(5, self.frame.size.width+5, self.frame.size.width, 20)];
    self.newproductName.text=@"西红柿";
    [self addSubview:self.newproductName];
    
    /**价格**/
    self.newsPrice=[[UILabel alloc] initWithFrame:CGRectMake(5, self.frame.size.width+10+20, self.frame.size.width, 30)];
    self.newsPrice.text=@"¥15";
    self.newsPrice.textColor=RGB(46, 174, 45);
    self.newsPrice.font=[UIFont boldSystemFontOfSize:15];
    [self addSubview:self.newsPrice];
    
    /*菜场价**/
    self.caichangjialab=[[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width-75, self.frame.size.width+10+20+5, self.frame.size.width, 20)];
    self.caichangjialab.font=[UIFont systemFontOfSize:11];
    self.caichangjialab.text=@"菜场价：";
    self.caichangjialab.textColor=RGB(96, 96, 96);
    [self addSubview:self.caichangjialab];
    
    /*菜场价格**/
    self.oldfPrice=[[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width-40, self.frame.size.width+10+20+5, self.frame.size.width, 20)];
    self.oldfPrice.text=@"¥17.00";
    self.oldfPrice.textColor=RGB(96, 96, 96);
    self.oldfPrice.font=[UIFont systemFontOfSize:11];
    [self addSubview:self.oldfPrice];

    
    


}
@end
