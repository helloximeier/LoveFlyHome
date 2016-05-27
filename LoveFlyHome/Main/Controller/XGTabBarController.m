//
//  XGTabBarController.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/5/26.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "XGTabBarController.h"
#import "XGNavgationController.h"
//导入相应类
#import "HomePageCtrl.h"
#import "ClassifyPageCtrl.h"
#import "ShopCarPageCtrl.h"
#import "MinePageCtrl.h"
#define commcolor [UIColor whiteColor]

@interface XGTabBarController()

@property(assign,nonatomic)HomePageCtrl *homepageCtrl;
@property(assign,nonatomic)ClassifyPageCtrl *classifyCtrl;
@property(assign,nonatomic)ShopCarPageCtrl *shopCarCtrl;
@property(assign,nonatomic)MinePageCtrl *mineCtrl;
@end
@implementation XGTabBarController

- (void)viewDidLoad
{
   
    [self addAllChildCtrl];
    self.view.backgroundColor=[UIColor whiteColor];

}

#pragma mark －添加子控制器
- (void)addAllChildCtrl
{
    //    通过appearance统一设置所有uitabbaritem的文字属性
    NSMutableDictionary *arrs=[NSMutableDictionary dictionary];
    //    设置字体大小
    arrs[NSFontAttributeName]=[UIFont systemFontOfSize:12];
    //    设置颜色
    arrs[NSForegroundColorAttributeName]=[UIColor grayColor];
    //    设置选中颜色
    NSMutableDictionary *selectArrs=[NSMutableDictionary dictionary];
    selectArrs[NSFontAttributeName]=arrs[NSFontAttributeName];
    //    颜色
    selectArrs[NSForegroundColorAttributeName]=[UIColor colorWithRed:64/255.0f green:186/255.0f blue:65/255.0f alpha:1.0];
    
    //    系统工具栏
    UITabBarItem *item=[UITabBarItem appearance];
    
    [item setTitleTextAttributes:arrs forState:UIControlStateNormal];
    //      选中选中状态
    [item setTitleTextAttributes:selectArrs forState:UIControlStateSelected];
    
    //    添加子控制器
    [self addOneChildVC:[[HomePageCtrl alloc] init] title:@"首页" imageName:@"home-0" selectImageName:@"home2-0"];
    [self addOneChildVC:[[ClassifyPageCtrl alloc] init] title:@"分类" imageName:@"class-0" selectImageName:@"class2-0"];
    [self addOneChildVC:[[ShopCarPageCtrl alloc] init] title:@"购物车" imageName:@"shopping-0" selectImageName:@"shopping2-0"];
    [self addOneChildVC:[[MinePageCtrl alloc] init] title:@"我的" imageName:@"me-0" selectImageName:@"me2-0"];
    
    UIView *backgroundView=[[UIView alloc] initWithFrame:self.tabBar.bounds];
    backgroundView.backgroundColor=[UIColor whiteColor];
    [self.tabBar insertSubview:backgroundView atIndex:0];
    self.tabBar.opaque=YES;
    

    

}
//设置tabBar图片大小
+ (UIImage *)sizeImage:(UIImage *)image tosize:(CGSize)resize
{
    
    UIGraphicsBeginImageContext(CGSizeMake(resize.width, resize.height));
    [image drawInRect:CGRectMake(0, 0, resize.width, resize.height)];
    //    设置图片
    UIImage *reSizeImages=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return reSizeImages;
    
}
- (void)addOneChildVC:(UIViewController *)childVC title:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName
{
    childVC.tabBarItem.title=title;
    childVC.tabBarItem.image=[[XGTabBarController sizeImage:[UIImage imageNamed:imageName] tosize:CGSizeMake(23, 23)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    childVC.tabBarItem.selectedImage=[[XGTabBarController sizeImage:[UIImage imageNamed:selectImageName] tosize:CGSizeMake(23, 23)]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    /**封装一个导航控制器**/
    XGNavgationController *navCtrl=[[XGNavgationController alloc] initWithRootViewController:childVC];

    [self addChildViewController:navCtrl];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:64/255.0f green:186/255.0f blue:65/255.0f alpha:1.0]];        [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                              [UIColor whiteColor],UITextAttributeTextColor,
                                                              nil]];

}
@end
