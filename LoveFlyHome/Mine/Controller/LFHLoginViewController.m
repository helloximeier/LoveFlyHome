//
//  LFHLoginViewController.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/5/31.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHLoginViewController.h"
#import "Public.h"

@interface LFHLoginViewController ()<UITextFieldDelegate>

@end

@implementation LFHLoginViewController
{
    UITextField *_phoneNumber;
    UITextField *_checkNumber;
    UIButton *_sendMsgBtn;
    
    NSUInteger _loginCodeCountDown;
    NSTimer *_timer;
    CGFloat _latitude;
    CGFloat _longitude;

}

- (instancetype)init
{
    self=[super init];
    if(self)
    {
        _latitude=0;
        _longitude=0;
    }
    return self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubViews];
    
}

- (void)initSubViews
{
    self.view.backgroundColor=RGB(235, 235, 235);
    
    UIView *topView=[[UIView alloc] init];
    topView.frame=CGRectMake(0, 0, screen_width, screen_height/3);
    [self.view addSubview:topView];
    
    UILabel *phoneLable=[[UILabel alloc] init];
    phoneLable.frame=CGRectMake(10, 30, 100, 30);
    phoneLable.text=@"手机号";
    phoneLable.textColor=[UIColor blackColor];
    phoneLable.font=[UIFont systemFontOfSize:16];
    [topView addSubview:phoneLable];
    /**电话**/
    _phoneNumber=[[UITextField alloc] init];
    _phoneNumber.frame=CGRectMake(100, 0, screen_width-105, 44);
    [_phoneNumber setTextAlignment:NSTextAlignmentLeft];
    [_phoneNumber setBackgroundColor:[UIColor colorWithWhite:255 alpha:0.9]];
    [_phoneNumber setTextColor:[UIColor blackColor]];
    [_phoneNumber setFont:[UIFont systemFontOfSize:14.0f]];
    [_phoneNumber setPlaceholder:@"输入手机号码"];
    [_phoneNumber setKeyboardType:UIKeyboardTypeNumberPad];
    [_phoneNumber setDelegate:self];
    [topView addSubview:_phoneNumber];
    
    /**验证码**/
    _checkNumber =  [[UITextField alloc] init];
    [_checkNumber setTextAlignment:NSTextAlignmentLeft];
    [_checkNumber setBackgroundColor:[UIColor colorWithWhite:255 alpha:0.9]];

    [_checkNumber setFont:[UIFont systemFontOfSize:14.0f]];
    [_checkNumber setPlaceholder:@"输入验证码"];
    [_checkNumber setKeyboardType:UIKeyboardTypeNumberPad];
    [_checkNumber setDelegate:self];
    [topView addSubview:_checkNumber];
    
//    [_checkNumber align:UnderMatchingLeft relativeTo:_phoneNumber padding:0.5f width:inputBgView.width-130.0f height:44.0f];
    
    
    _sendMsgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sendMsgBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_sendMsgBtn.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [_sendMsgBtn setTintColor:[UIColor whiteColor]];
    [_sendMsgBtn setBackgroundColor:RGB(64, 186, 64)];
    [_sendMsgBtn setClipsToBounds:YES];
    [_sendMsgBtn.layer setCornerRadius:3.0f];
    [_sendMsgBtn addTarget:self action:@selector(sendMsgClick:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:_sendMsgBtn];

    /**温馨提示**/
    UILabel *Warmprompt=[[UILabel alloc] init];
    Warmprompt.frame=CGRectMake(10, 120, 200, 30);
    Warmprompt.text=@"温馨提示：未注册帐号的手机号，登录时将自动注册。";
    Warmprompt.textColor=RGB(166,166,166);
    Warmprompt.font=[UIFont systemFontOfSize:13];
    [topView addSubview:Warmprompt];
    
    /**
     *登录
     **/
    
    
    
    
    
    


}

#pragma mark - event response
- (void)sendMsgClick:(id)sender
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
