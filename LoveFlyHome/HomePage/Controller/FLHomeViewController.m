//
//  FLHomeViewController.m
//  LoveFlyHome
//
//  Created by eclectic on 16/5/30.
//  Copyright © 2016年 ispoc. All rights reserved.
//

#import "FLHomeViewController.h"
#import "LFHRushFoodCell.h"
#import "Public.h"
#import "RushCell.h"
#import "wheelCell.h"
#import "LFHSpecialCell.h"
#import "LFHNewproductCell.h"

@interface FLHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic)UITableView *LHFtabView;
@end

@implementation FLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    /**
     *调用创建表格方法
     **/
    [self setUpTabView];
}

/**
 *创建表格
 **/
- (void)setUpTabView
{
    self.LHFtabView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height-64-49) style:UITableViewStyleGrouped];
    self.LHFtabView.dataSource=self;
    self.LHFtabView.delegate=self;
    
    
    /**设置分割线颜色**/
    [self.LHFtabView setSeparatorColor:RGB(230, 230, 230)];
    
    /**添加表格到视图上**/
    [self.view addSubview:self.LHFtabView];
    /**
     *注册单元格
     **/
    [self.LHFtabView registerNib:[UINib nibWithNibName:@"LFHRushFoodCell" bundle:nil] forCellReuseIdentifier:@"rushCell"];

}

#pragma mark -实现表格协议
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    

    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==1)
    {
        return 2;
    }else if (section==2)
    {
        return 2;
    }
    return 1;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        return 150.0;
    }else if (indexPath.section==1)
    {
        if(indexPath.row==0)
        {
            return 45;
        }else
        {
            return 160;
        }
        
    }else if (indexPath.section==2)
    
    {
        if(indexPath.row==0)
        {
            return 45;
        }else
        {
            return 160;
        }

        
    }else if (indexPath.section==3)
    {
        return 200.0;
    }else if(indexPath.section==4)
    {
        return 200.0;
    }else
    {
        return 0;
    }
    


}
#pragma mark -头部
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section==1)
    {
        return 0.5;
    }else
    {
        return 5;
    }
}

#pragma mark -脚部
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    if(section==1)
    {
        return 0.5;
    }
    return 5;
    
}
#pragma mark -头部视图大小 颜色
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 0.1)];
    headView.backgroundColor=RGB(239, 239, 244);
    return headView;
    
}

#pragma mark -脚部视图大小 颜色
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 0)];
    
    footView.backgroundColor=RGB(239, 239, 244);
    return footView;
}


#pragma mark-表格重用机制
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        /**滚动视图**/
        static NSString *acell=@"wheelcell";
        wheelCell *cell=[tableView dequeueReusableCellWithIdentifier:acell];
        if(cell==nil)
        {
            
            cell=[[wheelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:acell];
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;

    
    }else if (indexPath.section==1)
    {
        if(indexPath.row==0)
        {
            
            static NSString *acell=@"acell";
            UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:acell];
            if(cell==nil)
            {
                cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:acell];
                
            }
            
            UIImageView *rushImg=[[UIImageView alloc] init];
            rushImg.frame=CGRectMake(screen_width/2-100, 7, 200, 35);
            rushImg.image=[UIImage imageNamed:@"rush-img"];
            [cell addSubview:rushImg];
 
            return cell;
        }else
        {
            /**立即抢购**/
            static NSString *rushCell=@"rushCELL";
            LFHRushFoodCell *RUSHCELL=[tableView dequeueReusableCellWithIdentifier:rushCell];
            if(!RUSHCELL)
            {
                RUSHCELL=[[[NSBundle mainBundle] loadNibNamed:@"LFHRushFoodCell" owner:self options:nil] lastObject];
            }
            RUSHCELL.selectionStyle=UITableViewCellEditingStyleNone;
            return RUSHCELL;
        
        
        
        }
        
    }else if (indexPath.section==2)
    {
        if(indexPath.row==0)
        {
            static NSString *acell=@"Specialcell";
            UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:acell];
            if(cell==nil)
            {
                cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:acell];
                
            }
            
            UIImageView *rushImg=[[UIImageView alloc] init];
            rushImg.frame=CGRectMake(screen_width/2-100, 7, 200, 35);
            rushImg.image=[UIImage imageNamed:@"special"];
            [cell addSubview:rushImg];
            
            return cell;

        
        
        }else
        {
            /**
             *特价商品
             **/
            static NSString *specialCell=@"SpecialCELL";
            LFHSpecialCell *SpecialCELL=[tableView dequeueReusableCellWithIdentifier:specialCell];
            if(!SpecialCELL)
            {
                SpecialCELL=[[[NSBundle mainBundle] loadNibNamed:@"LFHSpecialCell" owner:self options:nil] lastObject];
            
            
            }
            
            SpecialCELL.selectionStyle=UITableViewCellEditingStyleNone;
            return SpecialCELL;
        }
    
    
    }else if (indexPath.section==3)
    {
        static NSString *NewProductCell=@"newProductCell";
        LFHNewproductCell  *newProductCELL=[tableView dequeueReusableCellWithIdentifier:NewProductCell];
        if(!newProductCELL)
        {
            newProductCELL=[[[NSBundle mainBundle] loadNibNamed:@"LFHNewproductCell" owner:self options:nil] lastObject];
        
        }
        newProductCELL.selectionStyle=UITableViewCellEditingStyleNone;
        return newProductCELL;

    }
    else
    {
    
        static NSString *acell=@"cell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:acell];
        if(cell==nil)
        {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:acell];
        
        }
        return cell;
    
    }
    
    
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
