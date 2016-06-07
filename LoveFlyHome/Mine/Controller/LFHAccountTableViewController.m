//
//  LFHAccountTableViewController.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/3.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHAccountTableViewController.h"
#import "Public.h"
#import "Masonry.h"
#import "CuiPickerView.h"
#import "LFHAdddressController.h"
#import "LFHSelectWorMViewController.h"
#import "ImagePickerManager.h"

@interface LFHAccountTableViewController ()<UITableViewDataSource,UITableViewDelegate,CuiPickViewDelegate,UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate>
{
    UIActionSheet *_myActionSheet;


}
@property(strong,nonatomic)CuiPickerView *lfhpickerView;
@property(strong,nonatomic)NSString *dataString;

@property(strong,nonatomic)UITableView *accountTabView;

@property(strong,nonatomic)UITextField *textFiled;
@property(strong,nonatomic)UIView *contentView;

@property(strong,nonatomic)LFHSelectWorMViewController *selecterWandM;


@end

@implementation LFHAccountTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavgationViw];
    self.view.backgroundColor=[UIColor whiteColor];
    
    /**创建表格**/
    self.accountTabView=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, screen_width, screen_height)];
    self.accountTabView.dataSource=self;
    self.accountTabView.delegate=self;
    //    设置分割线颜色
    [self.accountTabView setSeparatorColor:RGB(230, 230, 230)];
    
    [self.view addSubview:self.accountTabView];
    
    self.contentView=[[UIView alloc] initWithFrame:CGRectMake(0, 64, screen_width, screen_height-64-49)];
    
    
   
}



#pragma mark --设置导航栏
- (void)setNavgationViw
{
    UIView *navView=[UIView new];
    navView.backgroundColor=RGB(64, 186, 64);
    [self.view addSubview:navView];
    [navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).with.offset(0);
        make.right.mas_equalTo(self.view).with.offset(0);
        make.top.mas_equalTo(self.view).with.offset(0);
        make.height.equalTo(@64);
        
    }];
    UIButton *backBtn=[UIButton new];
    [backBtn setImage:[UIImage imageNamed:@"navigation_bar_back"] forState:UIControlStateNormal];
    [navView addSubview:backBtn];
    [backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(navView).with.offset(5);
        make.bottom.mas_equalTo(navView).with.offset(-8);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
    
    UILabel *accountLab=[UILabel new];
    accountLab.text=@"我的帐户";
    accountLab.textColor=[UIColor whiteColor];
    accountLab.font=[UIFont systemFontOfSize:12];
    [navView addSubview:accountLab];
    [accountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backBtn).with.offset(5+20+5);
        make.bottom.mas_equalTo(navView).with.offset(-5);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];

}

#pragma mark --返回
- (void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];

}

#pragma mark --实现代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 8;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==7)
    {
        return screen_height-50*7;
    
    }
    return 50.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section==0)
    {
        return 10.0;
    
    }else if (section==1)
    {
        return 10.0;
    }else
    {
        return 1.0;
    
    }
    

}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if(section==0)
    {
        UIView *footView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 10)];
        footView.backgroundColor=RGB(234, 234, 234);
        
        return footView;
    }else if (section==1)
    {
        UIView *footView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 10)];
        footView.backgroundColor=RGB(234, 234, 234);
        
        return footView;
    
    }
    else
    {
        return 0;
    }

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        static NSString *acell=@"cell";
        UITableViewCell *Cell=[tableView dequeueReusableCellWithIdentifier:acell];
        if(!Cell)
        {
            Cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:acell];
        }
        UILabel *accountLab=[UILabel new];
        accountLab.text=@"帐号与安全";
        accountLab.textColor=RGB(123, 123, 123);
        accountLab.font=[UIFont systemFontOfSize:15];
        [Cell addSubview:accountLab];
        [accountLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Cell).with.offset(10);
            make.top.mas_equalTo(Cell).with.offset(5);
            make.bottom.mas_equalTo(Cell).with.offset(-5);
            make.width.equalTo(@100);
        }];
        UIButton *lockbtn=[[UIButton alloc] init];
        [lockbtn setImage:[UIImage imageNamed:@"图标-38"] forState:UIControlStateNormal];
        [Cell addSubview:lockbtn];
        [lockbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(Cell).with.offset(-10);
            make.right.mas_equalTo(Cell).with.offset(-screen_width/2+70);
            make.width.equalTo(@25);
            make.height.equalTo(@25);
        }];
        
        UILabel *alresabaohu=[UILabel new];
        alresabaohu.text=@"已保护";
        alresabaohu.textColor=RGB(123, 123, 123);
        alresabaohu.font=[UIFont systemFontOfSize:15];
        [Cell addSubview:alresabaohu];
        [alresabaohu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(lockbtn).with.offset(25+10);
            make.top.mas_equalTo(Cell).with.offset(5);
            make.bottom.mas_equalTo(Cell).with.offset(-5);
            make.right.mas_equalTo(Cell).with.offset(-50);
        }];
        /**右侧标识图*/
        Cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
        ;
        return Cell;
    
    }else if (indexPath.section==1)
    {
        static NSString *messagecell=@"messagecell";
        UITableViewCell *messageCell=[tableView dequeueReusableCellWithIdentifier:messagecell];
        if(!messageCell)
        {
            messageCell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:messagecell];
        }
        UILabel *messageLab=[UILabel new];
        messageLab.text=@"消息提醒";
        messageLab.textColor=RGB(123, 123, 123);
        messageLab.font=[UIFont systemFontOfSize:15];
        [messageCell addSubview:messageLab];
        [messageLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(messageCell).with.offset(10);
            make.top.mas_equalTo(messageCell).with.offset(5);
            make.bottom.mas_equalTo(messageCell).with.offset(-5);
            make.width.equalTo(@100);
        }];
        /**开关  消息提醒**/
        UISwitch *switchBtn=[UISwitch new];
        [messageCell addSubview:switchBtn];
        [switchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(messageCell).with.offset(-25);
            make.top.mas_equalTo(messageCell).with.offset(10);
            make.bottom.mas_equalTo(messageCell).with.offset(-10);
            make.width.equalTo(@40);
            
        }];
      
        return messageCell;
    }else if (indexPath.section==2)
    {
        static NSString *headcell=@"headcell";
        UITableViewCell *headCell=[tableView dequeueReusableCellWithIdentifier:headcell];
        if(!headCell)
        {
            headCell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:headcell];
        }
        UILabel *headLab=[UILabel new];
        headLab.text=@"头像";
        headLab.textColor=RGB(123, 123, 123);
        headLab.font=[UIFont systemFontOfSize:15];
        [headCell addSubview:headLab];
        [headLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(headCell).with.offset(10);
            make.top.mas_equalTo(headCell).with.offset(5);
            make.bottom.mas_equalTo(headCell).with.offset(-5);
            make.width.equalTo(@100);
        }];
        UIButton *headBtn=[UIButton new];
        headBtn.layer.cornerRadius=10;
        [headBtn setImage:[UIImage imageNamed:@"unlogin_head_h"] forState:UIControlStateNormal];
        [headCell addSubview:headBtn];
        [headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(headCell).with.offset(-40);
            make.bottom.mas_equalTo(headCell).with.offset(-3);
            make.width.equalTo(@30);
            make.height.equalTo(@30);
        }];
        [headBtn addTarget:self action:@selector(updateHeadImageClick) forControlEvents:UIControlEventTouchUpInside];
        /**右侧标识图*/
        headCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
        ;
        return headCell;
    
    
    }else if (indexPath.section==3)
    {
    
        static NSString *namecell=@"namecell";
        UITableViewCell *nameCell=[tableView dequeueReusableCellWithIdentifier:namecell];
        if(!nameCell)
        {
            nameCell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:namecell];
        }
        UILabel *nameLab=[UILabel new];
        nameLab.text=@"姓名";
        nameLab.textColor=RGB(123, 123, 123);
        nameLab.font=[UIFont systemFontOfSize:15];
        [nameCell addSubview:nameLab];
        [nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(nameCell).with.offset(10);
            make.top.mas_equalTo(nameCell).with.offset(5);
            make.bottom.mas_equalTo(nameCell).with.offset(-5);
            make.width.equalTo(@100);
        }];
        
//        UILabel *namelables=[UILabel new];
        

        return nameCell;
    }else if(indexPath.section==4)
    {
        //性别填写
//

        static NSString *Sexacell=@"sexell";
        UITableViewCell *SexCell=[tableView dequeueReusableCellWithIdentifier:Sexacell];
        if(!SexCell)
        {
            SexCell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Sexacell];
        }
        UILabel *sexLab=[UILabel new];
        sexLab.text=@"性别";
        sexLab.textColor=RGB(123, 123, 123);
        sexLab.font=[UIFont systemFontOfSize:15];
        [SexCell addSubview:sexLab];
        [sexLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(SexCell).with.offset(10);
            make.top.mas_equalTo(SexCell).with.offset(5);
            make.bottom.mas_equalTo(SexCell).with.offset(-5);
            make.width.equalTo(@100);
        }];
       
        return SexCell;
    
    }else if (indexPath.section==5)
    {
        static NSString *birthdaycell=@"birthdaycell";
        UITableViewCell *birthdayCell=[tableView dequeueReusableCellWithIdentifier:birthdaycell];
        if(!birthdayCell)
        {
            birthdayCell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:birthdaycell];
        }
        UILabel *birthdayLab=[UILabel new];
        birthdayLab.text=@"生日";
        birthdayLab.textColor=RGB(123, 123, 123);
        birthdayLab.font=[UIFont systemFontOfSize:15];
        [birthdayCell addSubview:birthdayLab];
        [birthdayLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(birthdayCell).with.offset(10);
            make.top.mas_equalTo(birthdayCell).with.offset(5);
            make.bottom.mas_equalTo(birthdayCell).with.offset(-5);
            make.width.equalTo(@100);
        }];
        
        /**时间选择器**/
        self.textFiled=[[UITextField alloc] init];
        /**时间选择器**/
        self.textFiled.delegate=self;
        self.lfhpickerView=[[CuiPickerView alloc] init];
        self.lfhpickerView.frame=CGRectMake(0, screen_height, screen_width, 240);
        
        self.lfhpickerView.myTextField=self.textFiled;
        
        self.lfhpickerView.delegate=self;
        self.lfhpickerView.curDate=[NSDate date];
        [self.view addSubview:self.lfhpickerView];
        [birthdayCell addSubview:self.textFiled];
        [self.textFiled mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(birthdayCell).with.offset(screen_width/2-30);
            make.top.mas_equalTo(birthdayCell).with.offset(5);
            make.bottom.mas_equalTo(birthdayCell).with.offset(-5);
            make.right.mas_equalTo(birthdayCell).with.offset(-30);
        }];

        return birthdayCell;
    }else if (indexPath.section==6)
    {
        static NSString *addresscell=@"addresscell";
        UITableViewCell *addressCell=[tableView dequeueReusableCellWithIdentifier:addresscell];
        if(!addressCell)
        {
            addressCell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addresscell];
        }
        UILabel *addressLab=[UILabel new];
        addressLab.text=@"收货地址";
        addressLab.textColor=RGB(123, 123, 123);
        addressLab.font=[UIFont systemFontOfSize:15];
        [addressCell addSubview:addressLab];
        [addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(addressCell).with.offset(10);
            make.top.mas_equalTo(addressCell).with.offset(5);
            make.bottom.mas_equalTo(addressCell).with.offset(-5);
            make.width.equalTo(@100);
        }];
        UIButton *management=[UIButton new];
        [management setTitle:@"管理" forState:UIControlStateNormal];
        [management setTitleColor:RGB(159, 159,159) forState:UIControlStateNormal];
        management.titleLabel.font=[UIFont systemFontOfSize:15];
        [addressCell addSubview:management];
        [management mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(addressCell).with.offset(-60);
            make.top.mas_equalTo(addressCell).with.offset(10);
            make.bottom.mas_equalTo(addressCell).with.offset(-10);
            make.width.equalTo(@40);
        }];
        [management addTarget:self action:@selector(manageClick) forControlEvents:UIControlEventTouchUpInside];
        /**右侧标识图*/
        addressCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
        ;
        return addressCell;
    }else
    {
        static NSString *btncell=@"btncell";
        UITableViewCell *exitbtnCell=[tableView dequeueReusableCellWithIdentifier:btncell];
        if(!exitbtnCell)
        {
            exitbtnCell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:btncell];
        }
        UIButton *exitbtn=[UIButton new];
        exitbtn.backgroundColor=RGB(235, 235, 235);
        [exitbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [exitbtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [exitbtnCell addSubview:exitbtn];
        [exitbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(exitbtnCell).with.offset(10);
            make.right.mas_equalTo(exitbtnCell).with.offset(-10);
            make.top.mas_equalTo(exitbtnCell).with.offset(10);
            make.height.equalTo(@60);
        }];
        [exitbtn addTarget:self action:@selector(exitBtnClick) forControlEvents:UIControlEventTouchUpInside];
        return exitbtnCell;
    }

}


#pragma mark --点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==4)
    {
        LFHSelectWorMViewController *selectedSex = [[LFHSelectWorMViewController alloc]init];
        ////        selectedSex.sex =;
        //        selectedSex.selectedSexSuccess = ^(NSString *sex){
        //            LFHAccountTableViewController *cell = (LFHAccountTableViewController *)[self.tableView cellForRowAtIndexPath:_tempIndePath];
        //            cell.contentLabel.text = sex;
        //            _sex = sex;
        //        };
                [self.navigationController pushViewController:selectedSex animated:YES];
        
    }


}


#pragma mark -------- TFPickerDelegate


#pragma mark --开始编辑

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.inputView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.lfhpickerView showInView:self.view];
    
}

//赋值给textField
-(void)didFinishPickView:(NSString *)date
{
    self.dataString = date;
    
    self.textFiled.text = date;
}
- (void)updateHeadImageClick
{
    NSLog(@"修改头像");
    _myActionSheet=[[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册选取", nil];
    [_myActionSheet showInView:self.contentView];
    
    
    
}

#pragma mark --<UIActionSheetDelegate>
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    /**
     *相册
     **/
    if(buttonIndex==1)
    {
        [[ImagePickerManager shareImagePickerManager] takePictureWithType:ImagePickerManagerTypePhotoLibrary
                                                               completion:^(BOOL success, id content) {
                                                                   if (success) {
//                                                                       [self updateheadImage:content];
                                                                   }
                                                               }];
    
    
    
    } // 拍照
    else if (buttonIndex == 0) {
        [[ImagePickerManager shareImagePickerManager] takePictureWithType:ImagePickerManagerTypeCamera
                                                               completion:^(BOOL success, id content) {
                                                                   if (success) {
//                                                                       [self updateheadImage:content];
                                                                   }
                                                               }];
    }





}

//-(void)updateheadImage:(UIImage  *)headimage{
////    [self showProgress:@"修改中"];
//    [URLMethod postImagesWithMothedName:XH_UPLOADIMG_URL parmeter:@{@"tid":[UserInformation shareUserInfo].userID} success:^(id responseObject) {
//        NSLog(@"%@",responseObject);
//        [_progressHud hide:YES];
//        [PublicErrorAlterView loadErrorView:@"修改成功"];
//        _headImageView.image = headimage;
//        NSNotification *notification = [NSNotification notificationWithName:@"uploadHeadeImage"
//                                                                     object:self userInfo:@{@"header":headimage}];
//        [[NSNotificationCenter defaultCenter] postNotification:notification];
//    } fail:^(id error) {
//        [PublicErrorAlterView loadErrorView:@"修改失败"];
//        
//    } images:@[headimage] imageName:@"image" controller:nil option:0];
//}


- (void)exitBtnClick
{
    NSLog(@"退出登录");
}
- (void)manageClick
{
    NSLog(@"管理地址");
    LFHAdddressController *addressCtrl=[[LFHAdddressController alloc] init];
    [self.navigationController pushViewController:addressCtrl animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
