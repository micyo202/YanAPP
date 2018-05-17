//
//  NavigationAlphaViewController.m
//  YanAPP
//
//  Created by Apple on 2018/5/17.
//  Copyright © 2018年 Yanzheng. All rights reserved.
//

#import "NavigationAlphaViewController.h"

@interface NavigationAlphaViewController ()

@end

@implementation NavigationAlphaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"透明导航栏";
    
    [self wr_setNavBarBackgroundAlpha:0.f];
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
