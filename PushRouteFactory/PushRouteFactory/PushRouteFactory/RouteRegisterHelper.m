//
//  RouteRegisterHelper.m
//  PushRouteFactory
//
//  Created by 0o on 2017/12/18.
//  Copyright © 2017年 Benight. All rights reserved.
//

#import "RouteRegisterHelper.h"
#import "RouteRegister.h"

/** 我的 */
static NSString *const RouteCustomMsg_me            = @"route://me";

/** test1 */
static NSString *const RouteCustomMsg_testVC_1         = @"route://test1";
/** test2 */
static NSString *const RouteCustomMsg_testVC_2         = @"route://test2";
/** test3 */
static NSString *const RouteCustomMsg_testVC_3         = @"route://test3";




@implementation RouteRegisterHelper

/** 注册*/
+ (void) registerRoutes{
    
    /** 我的 */
    [RouteRegister registerName:RouteCustomMsg_me withClassName:@"MeViewController" withPropertyDic:nil AppendingPropertyKeyValueDic:nil];
    
    
    //注册的时候有下面这三种传值方式
    /** 推送过来的KEY是userID,本地的是test1Property，所以要关联一下*/
    [RouteRegister registerName:RouteCustomMsg_testVC_1 withClassName:@"TestViewController" withPropertyDic:@{@"userID":@"testProperty1"} AppendingPropertyKeyValueDic:nil];
    
    /** 推送过来的参数key和本地的一样，也要关联下 */
    [RouteRegister registerName:RouteCustomMsg_testVC_2 withClassName:@"TestViewController" withPropertyDic:@{@"testProperty2":@"testProperty2"} AppendingPropertyKeyValueDic:nil];
    
    /** 推送过来的参数是空的 ,本地这个VC所需要的参数后台没有给我们，所以我们要自己加一下*/
    [RouteRegister registerName:RouteCustomMsg_testVC_3 withClassName:@"TestViewController" withPropertyDic:@{@"userID":@"testProperty1",@"testProperty2":@"testProperty2"} AppendingPropertyKeyValueDic:@{@"testType":@1}];

    
}

@end
