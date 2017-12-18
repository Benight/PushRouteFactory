//
//  PushRouteFactory.m
//  PushRouteFactory
//
//  Created by 0o on 2017/12/14.
//  Copyright © 2017年 Benight. All rights reserved.
//

#import "PushRouteFactory.h"
#import "RouteRegister.h"
#import "RouteRegisterHelper.h"
#import <objc/runtime.h>

@implementation PushRouteFactory

+ (void)initialize
{
    if (self == [PushRouteFactory class]) {
        [RouteRegisterHelper registerRoutes];
    }
}
#pragma mark - 外部调用
+ (UIViewController *)pushRouteFactorWithExtrasCustomStr:(NSString *)extrasCustomStr{
    
    // extrasCustomStr 中 参数需要 utf8 编码 ，防止出现 ?&= 字符
    
    NSArray *arr = [extrasCustomStr componentsSeparatedByString:@"?"];
    NSString *schemeStr = arr.firstObject;
    NSString *paramsStr = arr.lastObject;
    
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc]init];
    if (arr.count > 1 && paramsStr.length) {
        NSArray *paramArr = [paramsStr componentsSeparatedByString:@"&"];
        [paramArr enumerateObjectsUsingBlock:^(NSString *  _Nonnull propertyStr, NSUInteger idx, BOOL * _Nonnull stop) {
            NSArray *propertyArr = [propertyStr componentsSeparatedByString:@"="];
            NSString *propertyKey = propertyArr.firstObject;
            NSString *propertyValue = propertyArr.lastObject;
            propertyValue = [propertyValue stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            [paramDic setObject:propertyValue forKey:propertyKey];
        }];
    }
    
    
    //获取创建VC
    Class newClass = [RouteRegister callBackClassWithClassKey:schemeStr];
    UIViewController *vcInstance = [[newClass alloc] init];
    
    
    //VC赋值
    //先取出注册的KEY
    NSDictionary *vcKeys = [RouteRegister callBackPropertyDicWithClassKey:schemeStr];
    [paramDic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        // 检测这个对象是否存在该属性
        NSString *keyStr = [vcKeys objectForKey:key];
        
        if ([self checkIsExistPropertyWithInstance:vcInstance verifyPropertyName:keyStr]) {
            // 利用kvc赋值
            [vcInstance setValue:obj forKey:keyStr];
        }
    }];
    
    //再取出本地的key
    NSDictionary *locationkeys = [RouteRegister callBackLocationPropertyDicWithClassKey:schemeStr];
    [locationkeys enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([self checkIsExistPropertyWithInstance:vcInstance verifyPropertyName:key]) {
            [vcInstance setValue:obj forKey:key];
        }
    }];
    
    return vcInstance;
    
}


#pragma mark - propertys -- setter

/**
 *  检测对象是否存在该属性
 */
+ (BOOL)checkIsExistPropertyWithInstance:(id)instance verifyPropertyName:(NSString *)verifyPropertyName {
    
    unsigned int outCount, i;
    
    // 获取对象里的属性列表
    objc_property_t * properties = class_copyPropertyList([instance
                                                           class], &outCount);
    
    for (i = 0; i < outCount; i++) {
        objc_property_t property =properties[i];
        //  属性名转成字符串
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        
        // 判断该属性是否存在
        if ([propertyName isEqualToString:verifyPropertyName]) {
            free(properties);
            return YES;
        }
    }
    free(properties);
    
    return NO;
}

@end
