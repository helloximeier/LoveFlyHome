//
//  ClassDetailCollectionController.m
//  LoveFlyHome
//
//  Created by gpf on 16/5/27.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "ClassDetailCollectionController.h"
#import "Header.h"
#import "GoodsListItem.h"
#import "GoodDetailViewController.h"
@interface ClassDetailCollectionController ()
@property (nonatomic, retain) UICollectionViewFlowLayout * layout;
@end

@implementation ClassDetailCollectionController

//static NSString * const reuseIdentifier = @"GoodDetailCell";
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.layout = [[UICollectionViewFlowLayout alloc] init];
    }
    return [super initWithCollectionViewLayout:self.layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor backGroundColor];
    
    [self.collectionView registerClass:[GoodsListItem class] forCellWithReuseIdentifier:@"GoodsListItem"];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationImage.png"] forBarMetrics:UIBarMetricsCompact];
    
    // Do any additional setup after loading the view.
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((CGwidth - 130)/2, (CGwidth - 130)/2 + 53);
}

//设置横向间距
- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.0f;
}
//设置纵向的行间距
- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.0f;
}

//通过调整inset使单元格顶部和底部都有间距(inset次序: 上，左，下，右边)
- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    GoodDetailCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
//    if (!cell) {
//        cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
//    }
    GoodsListItem * cell = [GoodsListItem GoodsCollectionItem:collectionView withIndex:indexPath];
    cell.goodsImage.image = [UIImage imageNamed:@"navigationImage.png"];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsListItem * cell =(GoodsListItem *)[collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundColor = [UIColor yellowColor];
    GoodDetailViewController * detailView = [[GoodDetailViewController alloc] init];
    [self.navigationController pushViewController:detailView animated:YES];

}




@end
