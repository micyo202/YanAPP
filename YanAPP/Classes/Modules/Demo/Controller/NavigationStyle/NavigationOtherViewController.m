//
//  NavigationOtherViewController.m
//  YanAPP
//
//  Created by Apple on 2018/5/17.
//  Copyright © 2018年 Yanzheng. All rights reserved.
//

#import "NavigationOtherViewController.h"

@interface NavigationOtherViewController ()

@end

@implementation NavigationOtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"其他颜色导航栏";
    
    [self wr_setNavBarBarTintColor:DEFAULT_CYAN_COLOR];
    
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
