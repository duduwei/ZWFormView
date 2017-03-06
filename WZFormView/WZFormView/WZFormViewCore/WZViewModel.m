//
//  WZViewModel.m
//  WZFormView
//
//  Created by wei on 2017/3/6.
//  Copyright © 2017年 weizhenwei. All rights reserved.
//

#import "WZViewModel.h"
#import "WZModel.h"

#import <objc/runtime.h>
#import <objc/message.h>

@implementation WZViewModel

+(instancetype)initWZViewModelWithData:(NSArray *)dataArr andTitleArray:(NSArray *)titleArray
{
    WZViewModel* vMmodel = [[WZViewModel alloc] init];
    
    if(dataArr.count < 1)
        vMmodel.VMArray = [NSArray array];
    else
    {
        NSMutableArray* modelArray = [[NSMutableArray alloc] init];//最外层的model数组
        
        [modelArray addObject:titleArray];
        
        for(int i=0; i<dataArr.count; i++)
        {
            WZModel* model = [dataArr objectAtIndex:i];
            
            NSMutableArray* ivarArray = [[NSMutableArray alloc] init];//最里层的属性数组
            
            unsigned int count = 0;
            Ivar *Ivarlist = class_copyIvarList([WZModel class], &count);
            for(int x = 0; x<count; x++)
            {
                Ivar ivarx = Ivarlist[x];
                NSString* ivarName = [NSString stringWithUTF8String:ivar_getName(ivarx)];
                
                [ivarArray addObject:[model valueForKey:ivarName]];
            }
            
            [modelArray addObject:ivarArray];
        }
        
        if(modelArray.count > 0)
            vMmodel.VMArray = [[NSArray alloc] initWithArray:modelArray copyItems:YES];
        
    }
    
    return vMmodel;
}

@end
