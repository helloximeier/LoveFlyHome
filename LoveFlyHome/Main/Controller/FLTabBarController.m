//
//  FLTabBarController.m
//  LoveFlyHome
//
//  Created by eclectic on 16/5/30.
//  Copyright © 2016年 ispoc. All rights reserved.
//

#import "FLTabBarController.h"

#import "FLHomeViewController.h"
#import "FLHClassifyPageCtrl.h"
#import "FLMineCenterViewController.h"
#import "FLCartViewController.h"

#import "FLNavigationController.h"

@interface FLTabBarController ()

@end

@implementation FLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupViewControllers
{
    [self addChildViewController:[[FLHomeViewController alloc] init] title:@"首页" image:@"home_normal" selectedImage:@"home_selected"];
    [self addChildViewController:[[FLHClassifyPageCtrl alloc] init] title:@"分类" image:@"sort_normal" selectedImage:@"sort_selected"];
    [self addChildViewController:[[FLCartViewController alloc] init] title:@"购物车" image:@"cart_normal" selectedImage:@"cart_selected"];
    [self addChildViewController:[[FLMineCenterViewController alloc] init] title:@"个人中心" image:@"mine_normal" selectedImage:@"mine_selected"];
}

- (void)addChildViewController:(UIViewController *)childViewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    childViewController.title = title;
    [childViewController.tabBarItem setImage:[UIImage imageNamed:image]];
    [childViewController.tabBarItem setSelectedImage:[UIImage imageNamed:selectedImage]];
    FLNavigationController *navVc = [[FLNavigationController alloc] initWithRootViewController:childViewController];
    navVc.title = title;
    [self addChildViewController:navVc];
}
@end
