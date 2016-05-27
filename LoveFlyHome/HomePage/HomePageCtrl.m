//
//  HomePageCtrl.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/5/26.
//  Copyright © 2016年 Lefeng. All rights reserved.
//123

#import "HomePageCtrl.h"
#import "SearchBarView.h"
#import "UIBarButtonItem+Extension.h"
@interface HomePageCtrl()<searchBarViewDelegate>
@end
@implementation HomePageCtrl

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**调用导航栏**/
    [self setNavgationController];
}

#pragma mark -设置导航栏
- (void)setNavgationController
{
    /**导航栏左边**/
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem barButtonLeftItemWithImageName:@"HomePage_Message" target:self action:@selector(scanClick)];
    /**导航栏右边**/
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem barButtonRightItemWithImageName:@"HomePage_Message" target:self action:@selector(bellsclick)];
    /**将搜索条放到一个uiview上**/
    SearchBarView *searchview=[[SearchBarView alloc] initWithFrame:CGRectMake(0, 7, 240, 30)];
    searchview.delegate=self;
    self.navigationItem.titleView = searchview;
    
    
}
#pragma mark -左边按钮事件
- (void)scanClick
{
    NSLog(@"扫一扫");

}
#pragma mark -右边按钮事件
- (void)bellsclick
{
    NSLog(@"消息");

}

#pragma mark -顶部滚动视图



@end
