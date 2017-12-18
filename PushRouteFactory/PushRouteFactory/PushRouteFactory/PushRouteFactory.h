//
//  PushRouteFactory.h
//  PushRouteFactory
//
//  Created by 0o on 2017/12/14.
//  Copyright © 2017年 Benight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PushRouteFactory : NSObject

/**
 *  用后台定义的消息推送本地的VC
 *
 *  @param extrasCustomStr 消息
 *  @param callback        返回VC
 */
+ (UIViewController *)pushRouteFactorWithExtrasCustomStr:(NSString *)extrasCustomStr;
@end
