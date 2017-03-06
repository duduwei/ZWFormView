//
//  WZShowViewController.m
//  WZFormView
//
//  Created by wei on 2017/3/6.
//  Copyright © 2017年 weizhenwei. All rights reserved.
//

#import "WZShowViewController.h"
#import "WZModel.h"
#import "WZView.h"

@interface WZShowViewController ()

@end

@implementation WZShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"楼主好看不？";
    //self.view.backgroundColor = [UIColor grayColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;//tableview上部下部有空白的解决方法
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //模拟后台返回数据如下：
    NSArray* arr = @[@{@"name":@"小明1",@"age":@"18",@"sex":@"男神",@"other":@"十八一朵花"},@{@"name":@"小明2",@"age":@"18",@"sex":@"男神",@"other":@"十八一朵花"},@{@"name":@"小明3",@"age":@"18",@"sex":@"男神",@"other":@"十八一朵花"},@{@"name":@"小明4",@"age":@"18",@"sex":@"男神",@"other":@"十八一朵花"},@{@"name":@"小明5",@"age":@"18",@"sex":@"男神",@"other":@"十八一朵花"},@{@"name":@"小明6",@"age":@"18",@"sex":@"男神",@"other":@"十八一朵花"},@{@"name":@"小明7",@"age":@"18",@"sex":@"男神",@"other":@"十八一朵花"},@{@"name":@"小明8",@"age":@"18",@"sex":@"男神",@"other":@"十八一朵花"},@{@"name":@"小明9",@"age":@"18",@"sex":@"男神",@"other":@"十八一朵花"},@{@"name":@"小明10",@"age":@"18",@"sex":@"男神",@"other":@"十八一朵花"},@{@"name":@"小明11",@"age":@"18",@"sex":@"男神",@"other":@"十八一朵花"},@{@"name":@"小明12",@"age":@"18",@"sex":@"男神",@"other":@"十八一朵花"}];
    
    NSArray* titleArray = @[@"姓名",@"年龄",@"性别"];
    
    //初始化model，返回model数组
    NSMutableArray* modelArray = [[NSMutableArray alloc] init];
    for(int i=0; i<arr.count; i++)
    {
        NSDictionary* dicx = [arr objectAtIndex:i];
        WZModel* model = [[WZModel alloc] init];
        model.age = [dicx objectForKey:@"age"];
        model.name = [dicx objectForKey:@"name"];
        model.sex = [dicx objectForKey:@"sex"];
        
        [modelArray addObject:model];
    }
    
    WZView* wzView = [[WZView alloc] initWZViewWithData:modelArray andframe:CGRectMake(50, 100, SCREEN_WIDTH-100, 300) andTitleArray:titleArray];
    //wzView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:wzView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
