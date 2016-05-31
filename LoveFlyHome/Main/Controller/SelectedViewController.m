//
//  SelectedViewController.m
//  LoveFlyHome
//
//  Created by eclectic on 16/5/30.
//  Copyright © 2016年 ispoc. All rights reserved.
//

#import "SelectedViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "Public.h"

@interface SelectedViewController ()

@end

@implementation SelectedViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNav];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Init UserInterface
- (void)setupNav
{
    self.navigationController.navigationBar.barTintColor =RGB(64, 186, 65) ;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonLeftItemWithImageName:@"home_scan_code" target:self action:@selector(leftItemsClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonRightItemWithImageName:@"home_notification" target:self action:@selector(rightItemsClick)];
    
}

#pragma mark - Responds Events
- (void)leftItemsClick
{
    
}

- (void)rightItemsClick
{
    
}

@end
