//
//  WZViewModel.h
//  WZFormView
//
//  Created by wei on 2017/3/6.
//  Copyright © 2017年 weizhenwei. All rights reserved.
//

/*
 此Viewmodel返回后取VMArray，这是拼接之后的数据数组，方便初始化视图时直接拿取；
 总共分两次数组，第一层是model数组，第二层是属性值数组；
 属性值数组的顺序是按WZmodel里面的属性顺序来的，等同于直接显示的属性顺序。所以，请注意WZmodel的属性顺序；
 
 */

#import <Foundation/Foundation.h>

@interface WZViewModel : NSObject

@property(nonatomic,strong)NSArray* VMArray;

+(instancetype)initWZViewModelWithData:(NSArray*)dataArr andTitleArray:(NSArray*)titleArray;

@end
