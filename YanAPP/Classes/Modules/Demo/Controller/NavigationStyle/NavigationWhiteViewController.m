//
//  NavigationWhiteViewController.m
//  YanAPP
//
//  Created by Apple on 2018/5/17.
//  Copyright © 2018年 Yanzheng. All rights reserved.
//

#import "NavigationWhiteViewController.h"

@interface NavigationWhiteViewController ()

@end

@implementation NavigationWhiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"白色导航栏";
    
    self.statusBarStyle = UIStatusBarStyleDefault;
    [self wr_setNavBarBarTintColor:UIColor.whiteColor];//设置导航栏背景颜色
    [self wr_setNavBarTitleColor:UIColor.blackColor];//设置标题颜色
    [self wr_setNavBarTintColor:UIColor.blackColor];// 设置导航栏item颜色
    [self wr_setNavBarShadowImageHidden:NO];//显示分割线
    
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
