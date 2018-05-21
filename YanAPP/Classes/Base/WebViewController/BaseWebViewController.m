//
//  BaseWebViewController.m
//  YanAPP
//
//  Created by Apple on 2018/5/15.
//  Copyright © 2018年 Yanzheng. All rights reserved.
//

#import "BaseWebViewController.h"

@interface BaseWebViewController () <WKNavigationDelegate>

@property (nonatomic,assign) double lastProgress;//上次进度条位置

@end

@implementation BaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 更新导航栏Item按钮
-(void)updateNavigationItems{
    if (_isShowCloseItem) {
        if (self.webView.canGoBack) {
            self.navigationController.interactivePopGestureRecognizer.enabled = NO;
            [self addNavigationItemWithTitles:@[@"返回", @"关闭"] isLeft:YES target:self action:@selector(leftBtnClick:) tags:@[@"2000", @"2001"]];
            //[self addNavigationItemWithImageNames:@[@"navigation_back_white", @"navigation_close_white"] isLeft:YES target:self action:@selector(leftBtnClick:) tags:@[@2000, @2001]];
        }else{
            self.navigationController.interactivePopGestureRecognizer.enabled = YES;
            [self addNavigationItemWithTitles:@[@"返回"] isLeft:YES target:self action:@selector(leftBtnClick:) tags:@[@"2001"]];
            //[self addNavigationItemWithImageNames:@[@"navigation_back_white"] isLeft:YES target:self action:@selector(leftBtnClick:) tags:@[@2001]];
        }
    }
}

#pragma mark - 返回按钮点击事件
-(void)leftBtnClick:(UIButton *)btn{
    switch (btn.tag) {
        case 2000: {
            [super backBtnClicked];
            break;
        }
        case 2001: {
            if (self.presentingViewController) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }else{
                [self.navigationController popViewControllerAnimated:YES];
            }
            break;
        }
        default:
            break;
    }
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
