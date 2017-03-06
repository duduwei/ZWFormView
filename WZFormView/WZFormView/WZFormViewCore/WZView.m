//
//  WZView.m
//  WZFormView
//
//  Created by wei on 2017/3/6.
//  Copyright © 2017年 weizhenwei. All rights reserved.
//

#import "WZView.h"

#import "WZModel.h"
#import "WZViewModel.h"

#define FormViewWidth self.frame.size.width
#define FormViewHeight self.frame.size.height

#define FormCellHeight 44.0  //cell高度
#define FormLineNumber 3   //表单的列数；表单的行数是根据数组的count来的。

@interface WZView()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSArray* dataArray;//接收的总的model数据

@property(nonatomic,strong)WZViewModel* wzViewModel; //model数据处理后的、可以直接用在view上的数据

@property(nonatomic,strong)UITableView* mainTableView;//主表视图

@end


@implementation WZView
@synthesize wzViewModel;
@synthesize dataArray;
@synthesize mainTableView;


-(instancetype)initWZViewWithData:(NSArray *)PersonArr andframe:(CGRect)frame andTitleArray:(NSArray *)titleArray
{
    if(self = [super initWithFrame:frame] )
    {
        if(PersonArr.count < 1)
        {
            //加提示；
            return nil;
        }
        else
        {
            self.dataArray = [[NSArray alloc] initWithArray:PersonArr];
            self.wzViewModel = [WZViewModel initWZViewModelWithData:self.dataArray andTitleArray:titleArray];
        }
        
        mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, FormViewWidth, FormViewHeight) style:UITableViewStylePlain];
        mainTableView.delegate = self;
        mainTableView.dataSource = self;
        mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //mainTableView.bounces = NO;//禁用上下拉
        mainTableView.showsVerticalScrollIndicator = NO;//禁用滑动条
        //mainTableView.backgroundColor = [UIColor yellowColor];
        [self addSubview:mainTableView];
        /*
        mainTableView.layer.borderWidth = 1;
        mainTableView.layer.borderColor = [UIColor grayColor].CGColor;
        mainTableView.layer.masksToBounds = YES;
        */
        
    }
    return self;
}


#pragma mark - tableView代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count+1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return FormCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* WZIdentifair = @"WzCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:WZIdentifair];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:WZIdentifair];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        //cell.backgroundColor = [UIColor blueColor];
        
        //自定义视图样式
        for (int i=0; i< FormLineNumber; i++)
        {
            UIButton * bton = [UIButton buttonWithType:UIButtonTypeCustom];
            bton.frame = CGRectMake(FormViewWidth/FormLineNumber*i, 0, FormViewWidth/FormLineNumber, FormCellHeight);
            [bton setTitle:[[self.wzViewModel.VMArray objectAtIndex:indexPath.row] objectAtIndex:i] forState:UIControlStateNormal];
            [bton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [bton setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
            bton.userInteractionEnabled = NO;
            [cell.contentView addSubview:bton];
            
            bton.layer.borderWidth = 0.25;
            bton.layer.borderColor = [UIColor grayColor].CGColor;
            bton.layer.masksToBounds = YES;
        }
        
    }
    else
    {
        for( int i=0; i<cell.contentView.subviews.count; i++)
        {
            UIButton* bton = [cell.contentView.subviews objectAtIndex:i];
            [bton setTitle:[[self.wzViewModel.VMArray objectAtIndex:indexPath.row] objectAtIndex:i] forState:UIControlStateNormal];
        }
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

#pragma mark - 重设一下子视图的frame

-(void)layoutSubviews
{
    CGFloat hit;
    if(FormCellHeight*self.wzViewModel.VMArray.count > FormViewHeight)
        hit = FormViewHeight;
    else
        hit = FormCellHeight*self.wzViewModel.VMArray.count;
    
    self.mainTableView.frame = CGRectMake(0, 0, FormViewWidth, hit);
}

@end
