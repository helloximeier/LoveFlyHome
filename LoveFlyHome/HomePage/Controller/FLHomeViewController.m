//
//  FLHomeViewController.m
//  LoveFlyHome
//
//  Created by eclectic on 16/5/30.
//  Copyright © 2016年 ispoc. All rights reserved.
//

#import "FLHomeViewController.h"
#import "LFHRushFoodCell.h"
#import "Public.h"
#import "RushCell.h"
#import "wheelCell.h"
#import "LFHSpecialCell.h"
#import "LFHNewproductCell.h"
#import "LFHRushGoodsListItem.h"
#import "LFHNewproductCell.h"
#import "LFHRushBuyControl.h"

@interface FLHomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(strong,nonatomic)UICollectionView *LHFCollectionView;
@property (nonatomic, retain) UICollectionViewFlowLayout * layout;
@end

@implementation FLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.layout=[[UICollectionViewFlowLayout alloc] init];
    self.LHFCollectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height) collectionViewLayout:self.layout];
    self.LHFCollectionView.delegate=self;
    self.LHFCollectionView.dataSource=self;
    self.LHFCollectionView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.LHFCollectionView];
    /**注册collectionviewcell**/
    [self.LHFCollectionView registerClass:[LFHRushGoodsListItem class] forCellWithReuseIdentifier:@"LFHRushGoodsListItem"];
    [self.LHFCollectionView registerClass:[LFHNewProductCell class] forCellWithReuseIdentifier:@"LFHNewProductCell"];
    
    [self.LHFCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"acell"];
    
    
    /**注册区头**/
    [self.LHFCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeadViewID"];
    /**注册区尾**/
    [self.LHFCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterViewID"];
}

#pragma mark --设置区头视图
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if(section==0)
    {
        return CGSizeMake(0, 10);
    }else if(section==1)
    {
        return CGSizeMake(0, 40);
    }else if(section==2)
    {
        return CGSizeMake(0, 40);
    }else
    {
        return CGSizeMake(0, 10);
    }


}

#pragma mark --区尾
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if(section==0)
    {
        return CGSizeMake(0, 10);
    }else if(section==1)
    {
        return CGSizeMake(0, 10);
    }else if(section==2)
    {
        return CGSizeMake(0, 30);
    }
    else if(section==3)
    {
        return CGSizeMake(0, 30);
    
    }
    else
    {
        return CGSizeMake(0, 0);
    }
}

#pragma mark --设置区头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
           if([kind isEqual:UICollectionElementKindSectionHeader])
        {
            UICollectionReusableView *headerView=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HeadViewID" forIndexPath:indexPath];
            if (headerView == nil) {
                headerView = [[UICollectionReusableView alloc] init];
            }
            
            if(indexPath.section==1)
            {
                UIImageView *rushimg=[[UIImageView alloc] initWithFrame:CGRectMake(screen_width/2-100, 0, screen_width/2, 40)];
                rushimg.image=[UIImage imageNamed:@"rush-img"];
                [headerView addSubview:rushimg];
                
            }else if(indexPath.section==2)
            {
                UIImageView *rushimg=[[UIImageView alloc] initWithFrame:CGRectMake(screen_width/2-100, 0, screen_width/2, 40)];
                rushimg.image=[UIImage imageNamed:@"special"];
                [headerView addSubview:rushimg];
            }
            
            return headerView;
            
            
            
        }
    
        if ([kind isEqual:UICollectionElementKindSectionFooter])
        {
            UICollectionReusableView *footerView=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"FooterViewID" forIndexPath:indexPath];
            if (footerView == nil) {
                footerView = [[UICollectionReusableView alloc] init];
            }
            
            footerView.backgroundColor=RGB(235, 235, 235);
            
            if(indexPath.section==2)
            {
                UILabel *newLable=[[UILabel alloc] initWithFrame:CGRectMake(10, 5, screen_width, 20)];
                newLable.text=@"新品上市";
                [footerView addSubview:newLable];
                
            }else if(indexPath.section==3)
            {
//                UILabel *hotLable=[[UILabel alloc] initWithFrame:CGRectMake(10, 5, screen_width, 20)];
//                hotLable.text=@"热卖产品";
//                [footerView addSubview:hotLable];
                
                
            }
            
            return footerView;
            
            
        }
    return nil;


}




#pragma mark --设置item大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        
      return CGSizeMake(100, 150);
    
    }else if (indexPath.section==1)
    {
      
        return CGSizeMake(screen_width/3-20, 155);
    
    }else if (indexPath.section==2)
    {
        return CGSizeMake(screen_width/3-20, 155);
    
    }
    else
    {
        return CGSizeMake(screen_width/2-50, 200);
    
    }
    

}

#pragma mark --设置横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{

    return 5.0f;
}

#pragma mark --通过调整inset使单元格顶部和底部都有间距（inset次序：上，左，下，右）
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{

    return UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
}

#pragma mark --实现UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

    return 5;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(section==0)
    {
        return 1;
    }else if(section==1)
    {
        return 3;
    }else if (section==2)
    {
        return 3;
    }
    else
    {
        return 5;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        static NSString *acells=@"acell";
        UICollectionViewCell *cells=[collectionView dequeueReusableCellWithReuseIdentifier:acells forIndexPath:indexPath];
        if(cells==nil)
        {
            cells=[[UICollectionViewCell alloc] init];
            
        }
        UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 150)];
        img.image=[UIImage imageNamed:@"banner6.jpg"];
        [cells addSubview:img];
        return cells;
    }
    if(indexPath.section==1)
    {
        
         LFHRushGoodsListItem *goodsItemCell=[LFHRushGoodsListItem RushGoodsCollectionItem:collectionView withIndex:indexPath];
        
        return goodsItemCell;
    
    }else if (indexPath.section==2)
        
    {
        
         LFHRushGoodsListItem *goodsItemCell=[LFHRushGoodsListItem RushGoodsCollectionItem:collectionView withIndex:indexPath];
        
        return goodsItemCell;
    
    }
    else if(indexPath.section==3)
    {
        LFHNewProductCell *newProduct=[LFHNewProductCell NewProductGoodsCollectionItem:collectionView withIndex:indexPath];
        return newProduct;
    
    
    }else if(indexPath.section==4)
    {
        LFHNewProductCell *newProduct=[LFHNewProductCell NewProductGoodsCollectionItem:collectionView withIndex:indexPath];
        return newProduct;
    
    
    }
    return nil;

}

#pragma mark -点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    LFHRushGoodsListItem *cell=(LFHRushGoodsListItem *)[collectionView cellForItemAtIndexPath:indexPath];
    LFHRushBuyControl *rushBuy=[[LFHRushBuyControl alloc] init];
    [self.navigationController pushViewController:rushBuy animated:YES];
    NSLog(@"你点击了 %ld, %ld",indexPath.section, indexPath.row);

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
