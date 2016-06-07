//
//  LFHUpdateAddressViewCtrl.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/7.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHUpdateAddressViewCtrl.h"
#import "Public.h"
#import "Masonry.h"
#import "STPickerArea.h"
@interface LFHUpdateAddressViewCtrl ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,STPickerAreaDelegate,UITextViewDelegate>

@property(strong,nonatomic)UITableView *tableview;
@property(strong,nonatomic)UITextField *areaTextFile;
@property(strong,nonatomic)UITextView *detailAddessTextView;


@end

@implementation LFHUpdateAddressViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self setNavGationView];
    [self setTableview];
}

#pragma mark --创建导航栏视图
- (void)setNavGationView
{
    UIView *navView=[UIView new];
    navView.backgroundColor=RGB(64, 186, 64);
    [self.view addSubview:navView];
    [navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).with.offset(0);
        make.right.mas_equalTo(self.view).with.offset(0);
        make.top.mas_equalTo(self.view).with.offset(0);
        make.height.mas_equalTo(64);
    }];
    
    UIButton *backBtn=[UIButton new];
    [backBtn setImage:[UIImage imageNamed:@"navigation_bar_back"] forState:UIControlStateNormal];
    [navView addSubview:backBtn];
    
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(navView).with.offset(10);
        make.bottom.mas_equalTo(navView).with.offset(-10);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(25);
    }];
    
    [backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    
    /***保存按钮**/
    UIButton *rightBtn=[UIButton new];
    [rightBtn setTitle:@"保存" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [navView addSubview:rightBtn];
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(navView).with.offset(-15);
        make.bottom.mas_equalTo(navView).with.offset(-10);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(30);
    }];
    
    [rightBtn addTarget:self action:@selector(SaveBtnClick) forControlEvents:UIControlEventTouchUpInside];



}

#pragma mark --返回
- (void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];

}

#pragma mark --保存按钮事件
- (void)SaveBtnClick
{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"恭喜修改！保存成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];

}

#pragma mark --创建表格  懒加载
- (void )setTableview
{
   _tableview=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, screen_width, screen_height) style:UITableViewStylePlain];
    _tableview.delegate=self;
    _tableview.dataSource=self;
    /**分割线样式**/
    [_tableview setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [_tableview setSeparatorColor:RGB(235, 235, 235)];
    [self.view addSubview:_tableview];
   

}

#pragma mark --DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==3)
    {
        return 130;
    }else if(indexPath.section==5)
    {
    
        return screen_height/2;
    }else
    {
        return 50;
    }

}

#pragma mark --头部视图
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section==3)
    {
        return 5;
    }
    return 1;

}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if(section==3)
    {
        UIView *footerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 5)];
        footerView.backgroundColor=RGB(237, 238, 239);
        return footerView;
    
    }
    
    UIView *footerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 1)];
    footerView.backgroundColor=RGB(237, 238, 239);
    return footerView;


}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        static NSString *acell=@"acell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:acell];
        if(!cell)
        {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:acell];
            
        }
        UILabel *shouhuorenLab=[UILabel new];
        shouhuorenLab.text=@"收货人";
        [cell addSubview:shouhuorenLab];
        [shouhuorenLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(cell).with.offset(10);
            make.bottom.mas_equalTo(cell).with.offset(-10);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(60);
        }];
        
        return cell;

    
    
    }else if (indexPath.section==1)
    {
        static NSString *bcell=@"bcell";
        UITableViewCell *BCell=[tableView dequeueReusableCellWithIdentifier:bcell];
        if(!BCell)
        {
            BCell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:bcell];
            
        }
        
        UILabel *lianxitelephone=[UILabel new];
        lianxitelephone.text=@"联系电话";
        [BCell addSubview:lianxitelephone];
        [lianxitelephone mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(BCell).with.offset(10);
            make.bottom.mas_equalTo(BCell).with.offset(-10);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(80);
        }];

        return BCell;

    
    
    }else if (indexPath.section==2)
    {
        static NSString *ccell=@"ccell";
        UITableViewCell *Ccell=[tableView dequeueReusableCellWithIdentifier:ccell];
        if(!Ccell)
        {
            Ccell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ccell];
            
        }
        UILabel *area=[UILabel new];
        area.text=@"所在地区";
        [Ccell addSubview:area];
        [area mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Ccell).with.offset(10);
            make.bottom.mas_equalTo(Ccell).with.offset(-10);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(80);
        }];
        
        self.areaTextFile=[UITextField new];
        self.areaTextFile.delegate=self;

        [Ccell addSubview:self.areaTextFile];
        [self.areaTextFile mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(Ccell).with.offset(-30);
            make.bottom.mas_equalTo(Ccell).with.offset(0);
            make.height.mas_equalTo(44);
            make.left.mas_equalTo(area).with.offset(120);
        }];
        
        
        
        Ccell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        return Ccell;

    
    
    }else if (indexPath.section==3)
    {
    
        static NSString *Dcell=@"Dcell";
        UITableViewCell *DCell=[tableView dequeueReusableCellWithIdentifier:Dcell];
        if(!DCell)
        {
            DCell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Dcell];
            
        }
        
        self.detailAddessTextView=[UITextView new];
        self.detailAddessTextView.delegate=self;
        [DCell addSubview:self.detailAddessTextView];
        [self.detailAddessTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(DCell).with.offset(0);
            make.right.mas_equalTo(DCell).with.offset(0);
            make.top.mas_equalTo(DCell).with.offset(0);
//            make.bottom.mas_equalTo(DCell).with.offset(0);
            make.height.mas_equalTo(130);
        }];
        
        return DCell;

    
    }else if (indexPath.section==4)
    {
        static NSString *ecell=@"ecell";
        UITableViewCell *Ecell=[tableView dequeueReusableCellWithIdentifier:ecell];
        if(!Ecell)
        {
            Ecell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ecell];
            
        }
        
        UIButton *deleteBtn=[UIButton new];
        [deleteBtn setTitle:@"删除地址" forState:UIControlStateNormal];
        [deleteBtn setTitleColor:RGB(64, 186, 64) forState:UIControlStateNormal];
        [Ecell addSubview:deleteBtn];
        [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Ecell).with.offset(10);
            make.bottom.mas_equalTo(Ecell).with.offset(-10);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(30);
        }];
        
        return Ecell;

    }else
    {
        static NSString *fcell=@"fcell";
        UITableViewCell *Fcell=[tableView dequeueReusableCellWithIdentifier:fcell];
        if(!Fcell)
        {
            Fcell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:fcell];
            
        }
        Fcell.backgroundColor=RGB(237, 238, 239);
        
        return Fcell;

    
    
    }
    
    

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.detailAddessTextView resignFirstResponder];
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.areaTextFile) {
        [self.areaTextFile resignFirstResponder];
        [[[STPickerArea alloc]initWithDelegate:self]show];
    }
}

- (void)pickerArea:(STPickerArea *)pickerArea province:(NSString *)province city:(NSString *)city area:(NSString *)area
{
    NSString *text = [NSString stringWithFormat:@"%@ %@ %@", province, city, area];
    self.areaTextFile.text = text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
