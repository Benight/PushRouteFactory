//
//  TableViewController.m
//  PushRouteFactory
//
//  Created by 0o on 2017/12/18.
//  Copyright © 2017年 Benight. All rights reserved.
//

#import "TableViewController.h"
#import "PushRouteFactory.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}


#pragma mark - Table view data source


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //模拟推送过来的消息
    NSString *pushStr = @"";
    switch (indexPath.row) {
        case 0: {
            pushStr = @"route://me";
        } break;
        case 1: {
            pushStr = @"route://test1?userID=123";

        } break;
        case 2: {
            pushStr = @"route://test2?testProperty2=345";

        } break;
        case 3: {
            pushStr = @"route://test3?userID=123&testProperty2=345";

        } break;
        default:
            break;
    }
    
    UIViewController *vc =  [PushRouteFactory pushRouteFactorWithExtrasCustomStr:pushStr];
    __block BOOL flag = NO;
    [self.tabBarController.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[vc class]]) {
            self.tabBarController.selectedIndex = idx;
            flag = YES;
            *stop = YES;
        }
    }];
    if (!flag) {
        [self.navigationController pushViewController:vc animated:YES];
    }
    


}

@end
