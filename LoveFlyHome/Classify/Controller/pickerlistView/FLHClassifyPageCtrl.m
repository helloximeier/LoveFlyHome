//
//  ClassifyPageCtrl.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/5/26.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "FLHClassifyPageCtrl.h"
#import "Header.h"
#import "FLNavigationController.h"
@implementation FLHClassifyPageCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:self.leftVC];
    [self addChildViewController:self.rightVC];
    [self.view addSubview:self.leftVC.view];
    [self.view addSubview:self.rightVC.collectionView];
    self.view.backgroundColor = [UIColor redColor];
    
    //获取通知中心单例对象
//    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
//    //添加当前类对象为一个观察者，name和object设置为nil，表示接收一切通知
//    [center addObserver:self selector:@selector(changeNavigationBackImage) name:@"changeNavigationImage" object:nil];
    
    
}

- (void)changeNavigationBackImage
{

    
}


#pragma mark - 懒加载
- (ClassDetailCollectionController *)rightVC
{
    if (_rightVC == nil) {
        self.rightVC = [[ClassDetailCollectionController alloc] init];
         self.rightVC.collectionView.frame = CGRectMake(100, 64, self.view.frame.size.width - 100, self.view.frame.size.height);
    }
    return _rightVC;
}

- (ClassTableViewController *)leftVC
{
    if (_leftVC == nil) {
        self.leftVC = [[ClassTableViewController alloc] init];
        self.leftVC.tableView.frame = CGRectMake(0, 0, 100, self.view.frame.size.height);
        self.leftVC.tableView.bounces = NO;
    }
    return _leftVC;
}



@end
