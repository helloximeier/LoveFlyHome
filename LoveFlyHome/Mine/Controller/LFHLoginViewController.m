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
    /**导航栏**/
    [self setNavgation];
    [self initSubViews];
    
}

#pragma mark -导航栏
- (void)setNavgation
{
    UIView *navView=[[UIView alloc] init];
    navView.frame=CGRectMake(0, 0, screen_width, 64);
    navView.backgroundColor=RGB(64, 186, 64);
    [self.view addSubview:navView];
    
    UIButton *backBtn=[[UIButton alloc] init];
    backBtn.frame=CGRectMake(10, 30, 15, 20);
    [backBtn setImage:[UIImage imageNamed:@"图标-20.png"] forState:UIControlStateNormal];
    [navView addSubview:backBtn];
    /**返回按钮事件**/
    [backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    


}

- (void)backClick
{
    NSLog(@"返回");
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)initSubViews
{
    self.view.backgroundColor=RGB(235, 235, 235);
    
    UIView *topView=[[UIView alloc] init];
    topView.frame=CGRectMake(0, 64, screen_width, screen_height/3);
    topView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:topView];
    
    UILabel *phoneLable=[[UILabel alloc] init];
    phoneLable.frame=CGRectMake(10, 20, 60, 30);
    phoneLable.text=@"手机号";
    phoneLable.textColor=[UIColor blackColor];
    phoneLable.font=[UIFont systemFontOfSize:14];
    [topView addSubview:phoneLable];
    /**电话**/
    _phoneNumber=[[UITextField alloc] init];
    _phoneNumber.frame=CGRectMake(65, 15, screen_width-105, 30);
    _phoneNumber.layer.borderWidth=1.0;
    _phoneNumber.layer.borderColor=RGB(154, 154, 154).CGColor;
    _phoneNumber.layer.cornerRadius=5.0;
    [_phoneNumber setTextAlignment:NSTextAlignmentLeft];
    [_phoneNumber setBackgroundColor:[UIColor colorWithWhite:255 alpha:0.9]];
    [_phoneNumber setTextColor:[UIColor blackColor]];
    [_phoneNumber setFont:[UIFont systemFontOfSize:14.0f]];
//    [_phoneNumber setPlaceholder:@"输入手机号码"];
    [_phoneNumber setKeyboardType:UIKeyboardTypeNumberPad];
    [_phoneNumber setDelegate:self];
    [topView addSubview:_phoneNumber];
    
    /**验证码**/
    _checkNumber =  [[UITextField alloc] init];
    _checkNumber.layer.borderColor=RGB(154, 154, 154).CGColor;
    _checkNumber.layer.borderWidth=1.0;
    _checkNumber.frame=CGRectMake(10,55 , screen_width-100, 30);
    _checkNumber.layer.cornerRadius=5.0;
    [_checkNumber setTextAlignment:NSTextAlignmentLeft];
    [_checkNumber setBackgroundColor:[UIColor colorWithWhite:255 alpha:0.9]];

    [_checkNumber setFont:[UIFont systemFontOfSize:14.0f]];
    [_checkNumber setPlaceholder:@"验证码"];
    [_checkNumber setKeyboardType:UIKeyboardTypeNumberPad];
    [_checkNumber setDelegate:self];
    [topView addSubview:_checkNumber];
    
//    [_checkNumber align:UnderMatchingLeft relativeTo:_phoneNumber padding:0.5f width:inputBgView.width-130.0f height:44.0f];
    
    
    _sendMsgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _sendMsgBtn.frame=CGRectMake(screen_width-85, 55, screen_width/2-80, 30);
    _sendMsgBtn.layer.borderWidth=1.0;
    _sendMsgBtn.layer.borderColor=RGB(154, 154, 154).CGColor;
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
    Warmprompt.frame=CGRectMake(10, 95, 300, 30);
    Warmprompt.text=@"温馨提示：未注册帐号的手机号，登录时将自动注册。";
    Warmprompt.textColor=RGB(98,98,98);
    Warmprompt.font=[UIFont systemFontOfSize:10];
    [topView addSubview:Warmprompt];
    
    /**
     *登录按钮
     **/
    UIButton *loginBtn=[[UIButton alloc] init];
    loginBtn.frame=CGRectMake(10, topView.frame.size.height-50, screen_width-20, 40);
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.backgroundColor=RGB(64, 185, 64);
    loginBtn.layer.cornerRadius=8.0;
    loginBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
    [topView addSubview:loginBtn];
    
    
    UILabel *otherLogin=[[UILabel alloc] init];
    otherLogin.frame=CGRectMake(screen_width/2-30, screen_height-180, screen_width/2, 30);
    otherLogin.text=@"第三方登录";
    otherLogin.textColor=[UIColor blackColor];
    otherLogin.font=[UIFont systemFontOfSize:13];
    [self.view addSubview:otherLogin];
    
    
    /**扣扣**/
    UIButton *qqBtn=[[UIButton alloc] init];
    qqBtn.frame=CGRectMake(screen_width/2-80, screen_height-120, 35, 40);
    [qqBtn setImage:[UIImage imageNamed:@"图标-26.png"] forState:UIControlStateNormal];
    [self.view addSubview:qqBtn];
    
    UILabel *qqLable=[[UILabel alloc] init];
    qqLable.frame=CGRectMake(screen_width/2-70, screen_height-80, 60, 30);
    qqLable.text=@"QQ";
    qqLable.textColor=[UIColor blackColor];
    qqLable.font=[UIFont systemFontOfSize:12];
    [self.view addSubview:qqLable];
    
    /**微信**/
    UIButton *WeChatBtn=[[UIButton alloc] init];
    WeChatBtn.frame=CGRectMake(screen_width/2+20, screen_height-120, 40, 40);
    [WeChatBtn setImage:[UIImage imageNamed:@"图标-27.png"] forState:UIControlStateNormal];
    [self.view addSubview:WeChatBtn];
    
    UILabel *WeChatLab=[[UILabel alloc] init];
    WeChatLab.frame=CGRectMake(screen_width/2+20, screen_height-80, 60, 30);
    WeChatLab.text=@"微信";
    WeChatLab.font=[UIFont systemFontOfSize:12];
    WeChatLab.textColor=[UIColor blackColor];
    [self.view addSubview:WeChatLab];
    
    
    
    
    
    


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
