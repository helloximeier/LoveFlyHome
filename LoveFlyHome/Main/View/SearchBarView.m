//
//  SearchBarView.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/5/26.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "SearchBarView.h"
#define kXMargin 8
#define kYMargin 4
#define kIconSize 20

#define kSearchBarHeight 30
@interface SearchBarView()

@property(nonatomic)UIButton *searchButton;

@property(nonatomic)RoundView *backgroundView;
@end
@implementation SearchBarView

#pragma mark - Initializers
- (void)setDefaults
{
    NSUInteger boundsWidth = self.bounds.size.width;
    NSUInteger boundsHeight= self.bounds.size.height;
 
    self.backgroundView = [[RoundView alloc] initWithFrame:CGRectMake(0, 0, boundsWidth, boundsHeight)];
    [self addSubview:self.backgroundView];
    
    UIImageView * img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.backgroundView.frame.size.width, self.backgroundView.frame.size.height)];
    img.image=[UIImage imageNamed:@"图标-58"];
    [self.backgroundView addSubview:img];
    self.searchButton = [[UIButton alloc] initWithFrame:CGRectMake(kIconSize*2, 0, boundsWidth - kIconSize*4, boundsHeight)];
    
    [self.searchButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    UIFont *defaultFont = [UIFont fontWithName:@"Avenir Next" size:14];
    self.searchButton.titleLabel.font=defaultFont;
    [self.searchButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.searchButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self.searchButton setTitle:@"请输入商品名称" forState:UIControlStateNormal];
    
    [self.searchButton addTarget:self action:@selector(pressedSearch:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.searchButton];


}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setDefaults];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    
    CGRect newFrame = frame;
    frame.size.height = kSearchBarHeight;
    frame = newFrame;
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setDefaults];
    }
    return self;
}
- (id)init
{
    return [self initWithFrame:CGRectMake(10, 20, 300, 32)];
}
- (void)pressedSearch: (id)sender {
    if ([self.delegate respondsToSelector:@selector(searchBarSearchButtonClicked:)])
        [self.delegate searchBarButtonClicked:self];
}
@end

@implementation RoundView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
@end
