//
//  LFHPayMentView.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/8.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHPayMentView.h"
#import "Masonry.h"


@interface LFHPayMentView ()<UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic)UITableView *orderTableView;
@end

@implementation LFHPayMentView

- (void)didMoveToSuperview
{
    /**注册单元格**/

//    [self setTabView];

}
#pragma mark -创建表格
//- (void)setTabView
//{
//    self.orderTableView=[UITableView new];
//    self.orderTableView.delegate=self;
//    self.orderTableView.dataSource=self;
//    [self addSubview:self.orderTableView];
//    [self.orderTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self).with.offset(0);
//        make.top.mas_equalTo(self).with.offset(44);
//        make.right.mas_equalTo(self).with.offset(0);
//        make.height.equalTo(self.mas_height);
//    }];
//    
//    
//}

#pragma mark --实现协议里面的方法
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//    
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 1;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    return 146.0;
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
////    static NSString *orderCell=@"LFHOrderCell";
////    orderCell *orderCELL=[tableView dequeueReusableCellWithIdentifier:orderCell forIndexPath:indexPath];
////
////    return orderCELL;
////    
//    
//}

@end
