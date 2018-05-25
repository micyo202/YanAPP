/************************************************************
 Class    : AppDelegate+AppService.m
 Describe : 应用程序主代理类扩展类，用于处理生命周期外的业务
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-04-17
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "AppDelegate+AppService.h"
#import <WRNavigationBar.h>
#import <AvoidCrash.h>
#import "MainTabBarController.h"
#import "YYFPSLabel.h"
#import "AdvertHelper.h"

@implementation AppDelegate (AppService)

#pragma mark - 初始化Window组件及root根视图
- (void)initializeWindow {
    
    MainTabBarController *mainTabBarController = [MainTabBarController sharedMainTabBarController];
    self.window = [[UIWindow alloc] initWithFrame:FRAME_SCREEN];
    self.window.backgroundColor = UIColor.clearColor;
    self.window.rootViewController = mainTabBarController;
    mainTabBarController.viewControllers[0].tabBarItem.badgeValue = @"2";
    [self.window makeKeyAndVisible];
    
    // 广告页设置
    NSArray <NSString *> *imagesURLS = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495189872684&di=03f9df0b71bb536223236235515cf227&imgtype=0&src=http%3A%2F%2Fatt1.dzwww.com%2Fforum%2F201405%2F29%2F1033545qqmieznviecgdmm.gif", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495189851096&di=224fad7f17468c2cc080221dd78a4abf&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201505%2F12%2F20150512124019_GPjEJ.gif"];
    // 启动广告
    [AdvertHelper showAdvertView:imagesURLS];
    
}

#pragma mark - 初始化顶部状态栏样式
- (void)initializeStatusBar {
    
    // 隐藏顶部状态栏设为NO
    APPLICATION.statusBarHidden = NO;
    // 设置顶部状态栏字体为黑色（默认）
    //APPLICATION.statusBarStyle = UIStatusBarStyleDefault;
    // 设置顶部状态栏字体为白色
    //APPLICATION.statusBarStyle = UIStatusBarStyleLightContent;
    
}

#pragma mark - 初始化导航栏
- (void)initializeNavigation {
    // 设置是 广泛使用WRNavigationBar，还是局部使用WRNavigationBar，目前默认是广泛使用
    [WRNavigationBar wr_widely];
    // WRNavigationBar 不会对 blackList 中的控制器有影响
    /*
    [WRNavigationBar wr_setBlacklist:@[
                                       @"MineViewController",
                                       @"MessageViewController"
                                       ]];
    */
    
    // 设置导航栏默认的背景颜色
    [WRNavigationBar wr_setDefaultNavBarBarTintColor:DEFAULT_YELLOW_COLOR];
    // 设置导航栏所有按钮的默认颜色
    [WRNavigationBar wr_setDefaultNavBarTintColor:[UIColor whiteColor]];
    // 设置导航栏标题默认颜色
    [WRNavigationBar wr_setDefaultNavBarTitleColor:[UIColor whiteColor]];
    // 统一设置状态栏样式
    [WRNavigationBar wr_setDefaultStatusBarStyle:UIStatusBarStyleLightContent];
    // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
    [WRNavigationBar wr_setDefaultNavBarShadowImageHidden:YES];
}

#pragma mark - 添加FPS监测
- (void)showFPS {
    YYFPSLabel *_fpsLabel = [YYFPSLabel new];
    [_fpsLabel sizeToFit];
    _fpsLabel.bottom = HEIGHT_SCREEN - HEIGHT_TAB_BAR;
    _fpsLabel.right = WIDTH_SCREEN - 10;
    //_fpsLabel.alpha = 0;
    [WINDOW addSubview:_fpsLabel];
}

#pragma mark - 避免应用程序崩溃，在Crash时收集日志
- (void)initializeAvoidCrash {
    [AvoidCrash becomeEffective];
    //监听通知:AvoidCrashNotification, 获取AvoidCrash捕获的崩溃日志的详细信息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealwithCrashMessage:) name:AvoidCrashNotification object:nil];
}

#pragma mark 应用Crash时收集日志信息
- (void)dealwithCrashMessage:(NSNotification *)note {
    //注意:所有的信息都在userInfo中
    //你可以在这里收集相应的崩溃信息进行相应的处理(比如传到自己服务器)
    DLog(@"%@",note.userInfo);
}

@end
