//
//  LFHAdddressController.m
//  LoveFlyHome
//
//  Created by Lefeng on 16/6/4.
//  Copyright © 2016年 Lefeng. All rights reserved.
//

#import "LFHAdddressController.h"
#import "Masonry.h"
#import "Public.h"
#import "LFHUpdateAddressViewCtrl.h"
@interface LFHAdddressController ()<UITableViewDataSource,UITableViewDelegate>
{
    BOOL isSelect;
    UIButton *checkBtn;

}

@property(strong,nonatomic)UITableView *addressTableview;
@end

@implementation LFHAdddressController

- (void)viewDidLoad {
    [super viewDidLoad];
    isSelect=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    /**设置导航栏**/
    [self setnavGation];
    self.addressTableview=[UITableView new];
    self.addressTableview.dataSource=self;
    self.addressTableview.delegate=self;
    [self.view addSubview:self.addressTableview];
    [self.addressTableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).with.offset(0);
        make.top.mas_equalTo(self.view).with.offset(64);
        make.right.mas_equalTo(self.view).with.offset(0);
        make.height.mas_equalTo(screen_height);
    }];
    
    /**设置分割线颜色**/
    [self.addressTableview setSeparatorColor:RGB(230, 230, 230)];
    
}

- (void)setnavGation
{
    UIView *navView=[UIView new];
    navView.backgroundColor=RGB(64, 186, 64);
    [self.view addSubview:navView];
    [navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).with.offset(0);
        make.top.mas_equalTo(self.view).with.offset(0);
        make.right.mas_equalTo(self.view).with.offset(0);
        make.height.mas_equalTo(64);
    }];
    
    UIButton *backBtn=[UIButton new];
    [backBtn setImage:[UIImage imageNamed:@"navigation_bar_back"] forState:UIControlStateNormal];
    [navView addSubview:backBtn];
    
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(navView).with.offset(10);
        make.bottom.mas_equalTo(navView).with.offset(-10);
        make.width.mas_equalTo(13);
        make.height.mas_equalTo(15);
    }];
    
    [backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
 

}

#pragma mark --添加收货地址
- (void)addShippingaddress
{
    UIButton *bottomBtn=[UIButton new];
    [bottomBtn setTitle:@"新增收货地址" forState:UIControlStateNormal];
    [bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    bottomBtn.backgroundColor=RGB(64, 186, 64);
    [self.view addSubview:bottomBtn];
    [bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).with.offset(0);
        make.right.mas_equalTo(self).with.offset(-screen_width);
        make.top.mas_equalTo(self).with.offset(0);
        make.bottom.mas_equalTo(self).with.offset(0);    }];


}

#pragma mark --返回上一级
- (void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];

}
#pragma mark --实现代理的方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0)
    {
        return 95;
    
    }else
    {
        return 50;
    
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0)
    {
        static NSString *addCell=@"acell";
        UITableViewCell *Cell=[tableView dequeueReusableCellWithIdentifier:addCell];
        if(!Cell)
        {
            Cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addCell];
            
        }
        
        UILabel *shouhuorenlab=[UILabel new];
        
        shouhuorenlab.text=@"收货人：";
        shouhuorenlab.font=[UIFont systemFontOfSize:15];
        [Cell addSubview:shouhuorenlab];
        [shouhuorenlab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Cell).with.offset(10);
            make.top.mas_equalTo(Cell).with.offset(10);
            make.width.mas_equalTo(80);
            make.height.mas_equalTo(30);
        }];
        UILabel *nameLab=[UILabel new];
        nameLab.text=@"李明";
        nameLab.font=[UIFont systemFontOfSize:15];
        [Cell addSubview:nameLab];
        [nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(shouhuorenlab).with.offset(60);
            make.top.mas_equalTo(Cell).with.offset(10);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(30);
        }];
        UILabel *telephoneNum=[UILabel new];
        telephoneNum.text=@"13058961525";
        telephoneNum.font=[UIFont systemFontOfSize:15];
        [Cell addSubview:telephoneNum];
        [telephoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(Cell).with.offset(-10);
            make.top.mas_equalTo(Cell).with.offset(10);
            make.left.mas_equalTo(nameLab).with.offset(120);
            make.height.mas_equalTo(30);
        }];
        
        UILabel *shouhuoaddresslab=[UILabel new];
        
        shouhuoaddresslab.text=@"收货地址：";
        shouhuoaddresslab.font=[UIFont systemFontOfSize:15];
        [Cell addSubview:shouhuoaddresslab];
        [shouhuoaddresslab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Cell).with.offset(10);
            make.bottom.mas_equalTo(Cell).with.offset(-10);
            make.width.mas_equalTo(80);
            make.height.mas_equalTo(30);
        }];
        
        UILabel *addresssName=[UILabel new];
        addresssName.text=@"浙江省金华市鹜城区";
        addresssName.font=[UIFont systemFontOfSize:15];
        [Cell addSubview:addresssName];
        [addresssName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(shouhuoaddresslab).with.offset(80);
            make.bottom.mas_equalTo(Cell).with.offset(-10);
            make.width.mas_equalTo(screen_width-10);
            make.height.mas_equalTo(30);
        }];

        return Cell;
    }else
    {
        static NSString *editorCell=@"editorcell";
        UITableViewCell *editorCELL=[tableView dequeueReusableCellWithIdentifier:editorCell];
        if(!editorCELL)
        {
            editorCELL=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:editorCell];
            
        }
        isSelect=NO;
        checkBtn=[UIButton new];
        [checkBtn setImage:[UIImage imageNamed:@"dz-2"] forState:UIControlStateNormal];
        
        [editorCELL addSubview:checkBtn];
        [checkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(editorCELL).with.offset(10);
            make.top.mas_equalTo(editorCELL).with.offset(10);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(20);
        }];
        [checkBtn addTarget:self action:@selector(checkBtnBox) forControlEvents:UIControlEventTouchUpInside];
        UILabel * defaultaddress=[UILabel new];
        defaultaddress.text=@"默认地址";
        defaultaddress.font=[UIFont systemFontOfSize:15];
        defaultaddress.textColor=RGB(92, 92, 92);
        [editorCELL addSubview:defaultaddress];
        [defaultaddress mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(checkBtn).with.offset(30);
            make.bottom.mas_equalTo(editorCELL).with.offset(-15);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(30);
        }];
        
        UIButton *editionBtn=[UIButton new];
        [editionBtn setImage:[UIImage imageNamed:@"dz-3"] forState:UIControlStateNormal];
        [editorCELL addSubview:editionBtn];
        [editionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(editorCELL).with.offset(-120);
            make.bottom.mas_equalTo(editorCELL).with.offset(-15);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(20);
        }];
        [editionBtn addTarget:self action:@selector(EditionClick) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *editionLab=[UIButton new];
        [editionLab setTitle:@"编辑" forState:UIControlStateNormal];
        [editionLab setTitleColor:RGB(116, 116, 116) forState:UIControlStateNormal];
        [editionLab addTarget:self action:@selector(EditionClick) forControlEvents:UIControlEventTouchUpInside];

        [editorCELL addSubview:editionLab];
        [editionLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(editionBtn).with.offset(20);
            make.bottom.mas_equalTo(editorCELL).with.offset(-10);
            make.right.mas_equalTo(editorCELL).with.offset(-75);
            make.height.mas_equalTo(30);
        }];
        
        UIButton *deleteBtn=[UIButton new];
        [deleteBtn setImage:[UIImage imageNamed:@"dz-4"] forState:UIControlStateNormal];
        [editorCELL addSubview:deleteBtn];
        [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(editorCELL).with.offset(-45);
            make.bottom.mas_equalTo(editorCELL).with.offset(-15);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(20);
            
        }];
        [deleteBtn addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
        UIButton *deleteLab=[UIButton new];
        [deleteLab setTitle:@"删除" forState:UIControlStateNormal];
        [deleteLab setTitleColor:RGB(116, 116, 116) forState:UIControlStateNormal];
        [deleteLab addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
        [editorCELL addSubview:deleteLab];
        [deleteLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(editorCELL).with.offset(-5);
            make.bottom.mas_equalTo(editorCELL).with.offset(-10);
            make.left.mas_equalTo(deleteBtn).with.offset(20);
            make.height.mas_equalTo(30);
        }];
        return editorCELL;

    }
    

}
#pragma mark --编辑
- (void)EditionClick
{
    NSLog(@"编辑");
    LFHUpdateAddressViewCtrl *update=[[LFHUpdateAddressViewCtrl alloc] init];
    [self.navigationController pushViewController:update animated:YES];


}
#pragma mark --删除
- (void)deleteClick
{

    NSLog(@"删除a");

}
#pragma mark --默认地址是否选中
- (void)checkBtnBox
{
    NSLog(@"==");
    if(isSelect==YES)
    {
         isSelect=NO;
     [checkBtn setImage:[UIImage imageNamed:@"dz-01"] forState:UIControlStateNormal];
       
    }
    else if(isSelect==NO)
    {
        
        [checkBtn setImage:[UIImage imageNamed:@"dz-02"] forState:UIControlStateNormal];
        isSelect=YES;
    }


}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if(indexPath.row==1)
//    {
//        
//      [checkBtn setImage:[UIImage imageNamed:@"dz-01"] forState:UIControlStateNormal];
//        isSelect=YES;
//    
//    }
//
//
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
