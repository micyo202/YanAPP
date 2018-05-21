//
//  RootWebViewController.h
//  YanAPP
//
//  Created by Apple on 2018/5/15.
//  Copyright © 2018年 Yanzheng. All rights reserved.
//

#import "BaseViewController.h"
#import <WebKit/WebKit.h>

@interface RootWebViewController : BaseViewController

@property (nonatomic, strong) WKWebView * webView;
@property (nonatomic, strong) UIProgressView * progressView;
@property (nonatomic, strong) UIColor *progressViewColor;
@property (nonatomic, weak) WKWebViewConfiguration * webConfiguration;
@property (nonatomic, copy) NSString * url;

- (instancetype)initWithUrl:(NSString *)url;

//更新进度条
- (void)updateProgress:(double)progress;

//更新导航栏按钮，子类去实现
- (void)updateNavigationItems;

@end
