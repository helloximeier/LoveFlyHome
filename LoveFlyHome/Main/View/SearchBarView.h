//
//  SearchBarView.h
//  LoveFlyHome
//
//  Created by Lefeng on 16/5/26.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *协议
 **/
@protocol searchBarViewDelegate;


@interface SearchBarView : UIView

@property(nonatomic,weak) id<searchBarViewDelegate>delegate;


@end
@protocol searchBarViewDelegate <NSObject>

@optional
- (void)searchBarButtonClicked:(SearchBarView *)searchBarView;
@end
@interface RoundView : UIView

@end
