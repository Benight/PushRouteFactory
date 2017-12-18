//
//  RouteRegister.m
//  PushRouteFactory
//
//  Created by 0o on 2017/12/14.
//  Copyright © 2017年 Benight. All rights reserved.
//

#import "RouteRegister.h"
#import <objc/runtime.h>

static NSString *classKeyStr = @"classKeyStr";
static NSString *propertyDicKeyStr = @"propertyDicKeyStr";
static NSString *locationPropertyKeyStr = @"locationPropertyKeyStr";

@implementation RouteRegister

static const NSMutableDictionary * dict;

+ (void)initialize{
    dict = [NSMutableDictionary new];
}

+ (void)registerName:(NSString *)name  withClassName:(NSString*)className withPropertyDic:(NSDictionary *)propertydic AppendingPropertyKeyValueDic:(NSDictionary *)locationPropertyDic{
    
    if (className.length == 0) {
        return;
    }
    const char *encodingClassName = [className cStringUsingEncoding:NSASCIIStringEncoding];
    
    Class newClass = objc_getClass(encodingClassName);
    if (!newClass) {
        
        Class superClass = [NSObject class];
        newClass = objc_allocateClassPair(superClass, encodingClassName, 0);
        objc_registerClassPair(newClass);
    }
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
    [dic setObject:newClass forKey:classKeyStr];
    if (propertydic != nil) {
        [dic setObject:propertydic forKey:propertyDicKeyStr];
    }
    if (locationPropertyDic != nil) {
        [dic setObject:locationPropertyDic forKey:locationPropertyKeyStr];
    }
    
    [dict setValue:dic forKey:name];
}

+ (Class)callBackClassWithClassKey:(NSString *)classKey {
    NSDictionary *dic = [dict objectForKey:classKey];
    return [dic objectForKey:classKeyStr];
}

+ (NSDictionary *)callBackPropertyDicWithClassKey:(NSString *)classKey {
    NSDictionary *dic = [dict objectForKey:classKey];
    return [dic objectForKey:propertyDicKeyStr];
}

+ (NSDictionary *)callBackLocationPropertyDicWithClassKey:(NSString *)classKey {
    NSDictionary *dic = [dict objectForKey:classKey];
    return [dic objectForKey:locationPropertyKeyStr];
}

@end
