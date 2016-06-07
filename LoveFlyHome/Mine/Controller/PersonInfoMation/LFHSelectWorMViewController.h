//
//  LFHSelectWorMViewController.h
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/7.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^SelectedSex)(NSString *sex);

@interface LFHSelectWorMViewController : UIViewController

@property (nonatomic,strong)SelectedSex selectedSexSuccess;
@property (nonatomic,strong)NSString *sex;
@end
