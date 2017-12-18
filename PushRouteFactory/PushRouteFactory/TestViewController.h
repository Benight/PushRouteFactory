//
//  TestViewController.h
//  PushRouteFactory
//
//  Created by 0o on 2017/12/18.
//  Copyright © 2017年 Benight. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TestType) {
    
    TestType_1 = 0,
    TestType_2 = 1,
};
@interface TestViewController : UIViewController

@property (nonatomic, assign) TestType testType;
@property (nonatomic, strong) NSString *testProperty1;
@property (nonatomic, strong) NSString *testProperty2;
@end
