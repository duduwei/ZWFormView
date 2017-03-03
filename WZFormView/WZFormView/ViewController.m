//
//  ViewController.m
//  WZFormView
//
//  Created by wei on 2017/3/3.
//  Copyright © 2017年 weizhenwei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"WZFormView";
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    NSArray* titleArr = [NSArray arrayWithObjects:@"类型1：数据完整",@"类型2：多种情况",@"类型2：多种情况", nil];
    
    for(int i=0; i<titleArr.count; i++)
    {
        UIButton* bton = [UIButton buttonWithType:UIButtonTypeCustom];
        [bton setTitle:titleArr[i] forState:UIControlStateNormal];
        [bton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        bton.layer.cornerRadius = 5;
        bton.layer.masksToBounds = YES;
        bton.layer.borderColor = [UIColor grayColor].CGColor;
        bton.layer.borderWidth = 0.5;
        bton.tag = 800+i;
        //[bton setBackgroundColor:[UIColor grayColor]];
        bton.frame = CGRectMake(15, 100+50*i, SCREEN_WIDTH-30, 44);
        
        [bton addTarget:self action:@selector(gotoShowVC:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:bton];
    }
}

-(void)gotoShowVC:(UIButton*)bton
{
    if(bton.tag == 801)
    {
        
    }
    else if (bton.tag == 802)
    {
        
    }
    else if (bton.tag == 802)
    {
        
    }
    
}



@end
