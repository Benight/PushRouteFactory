//
//  TestViewController.m
//  PushRouteFactory
//
//  Created by 0o on 2017/12/18.
//  Copyright © 2017年 Benight. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@property (weak, nonatomic) IBOutlet UILabel *testProperty1Label;
@property (weak, nonatomic) IBOutlet UILabel *testProperty2Label;
@property (weak, nonatomic) IBOutlet UILabel *testTypeLabel;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"\ntestProperty1=%@\ntestProperty2=%@\ntestType=%ld",self.testProperty1, self.testProperty2, self.testType);
    
    self.testProperty1Label.text = [NSString stringWithFormat:@"testProperty1:%@",self.testProperty1];
    self.testProperty2Label.text = [NSString stringWithFormat:@"testProperty2:%@",self.testProperty2];
    self.testTypeLabel.text = [NSString stringWithFormat:@"testType:%ld",(long)self.testType];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
