/************************************************************
 Class    : AppDelegate+AppService.h
 Describe : 应用程序主代理类扩展类，用于处理生命周期外的业务
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-04-17
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "AppDelegate.h"

@interface AppDelegate (AppService)

//初始化Window组件
- (void)initializeWindow;

//初始化顶部状态栏样式
- (void)initializeStatusBar;

// 避免应用程序崩溃，在Crash时收集日志
- (void)initializeAvoidCrash;

@end
