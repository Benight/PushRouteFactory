//
//  RouteRegister.h
//  PushRouteFactory
//
//  Created by 0o on 2017/12/14.
//  Copyright © 2017年 Benight. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RouteRegister : NSObject

/**
 *  根据推送的key注册本地的VC
 *
 *  @param name                推送的Key
 *  @param className           vcName
 *  @param propertydic         推送的属性所对应的本地的属性  @{@"推送过来的key":@"对应的本地的key"}
 *  @param locationPropertyDic 跳转VC，需要的其他属性（如type）@{@"key1":@"value1",@"key2":@"value2"}
 */
+ (void)registerName:(NSString *)name  withClassName:(NSString*)className withPropertyDic:(NSDictionary *)propertydic AppendingPropertyKeyValueDic:(NSDictionary *)locationPropertyDic;

/**
 *  通过key返回class
 */
+ (Class)callBackClassWithClassKey:(NSString *)classKey;

/**
 *  通过key返回属性的名称
 */
+ (NSDictionary *)callBackPropertyDicWithClassKey:(NSString *)classKey;

/**
 *  通过key返回本地的属性和属性的值
 */
+ (NSDictionary *)callBackLocationPropertyDicWithClassKey:(NSString *)classKey;
@end
