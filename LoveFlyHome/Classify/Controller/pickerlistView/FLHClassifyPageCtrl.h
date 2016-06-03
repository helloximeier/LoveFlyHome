//
//  ClassifyPageCtrl.h
//  LoveFlyHome
//
//  Created by Lefeng on 16/5/26.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassTableViewController.h"
#import "ClassDetailCollectionController.h"
@interface FLHClassifyPageCtrl : UIViewController

@property (nonatomic, strong) ClassDetailCollectionController * rightVC;
@property (nonatomic, strong) ClassTableViewController * leftVC;

@end
