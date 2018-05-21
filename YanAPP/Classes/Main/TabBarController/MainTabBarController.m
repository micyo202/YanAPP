/************************************************************
 Class    : MainTabBarController.m
 Describe : 主选项卡控制器，也是整个程序的root视图
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-04-17
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "MainTabBarController.h"
#import "RootNavigationController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

SingletonM(MainTabBarController)

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBar.tintColor = UIColor.blackColor;// 设置选中字体颜色
    
    // 初始化 TabBar 视图（必须先添加属性，在添加控制器，注意顺序）
    [self addTabBarItemsAttributes];
    [self addViewControllers];
    
}

#pragma mark - 添加 TabBar 属性
- (void)addTabBarItemsAttributes {
    NSArray *tabBarItemsAttributes = @[
                                       @{
                                           CYLTabBarItemTitle           :   @"首页",
                                           CYLTabBarItemImage           :   @"tabbar_home",
                                           CYLTabBarItemSelectedImage   :   @"tabbar_homeHL"
                                           },
                                       @{
                                           CYLTabBarItemTitle           :   @"位置",
                                           CYLTabBarItemImage           :   @"tabbar_location",
                                           CYLTabBarItemSelectedImage   :   @"tabbar_locationHL"
                                           },
                                       @{
                                           CYLTabBarItemTitle           :   @"消息",
                                           CYLTabBarItemImage           :   @"tabbar_message",
                                           CYLTabBarItemSelectedImage   :   @"tabbar_messageHL"
                                           },
                                       @{
                                           CYLTabBarItemTitle           :   @"我的",
                                           CYLTabBarItemImage           :   @"tabbar_mine",
                                           CYLTabBarItemSelectedImage   :   @"tabbar_mineHL"
                                           }
                                       ];
    
    self.tabBarItemsAttributes = tabBarItemsAttributes;
}

#pragma mark - 添加 TabBar 子视图控制器
- (void)addViewControllers {
    
    // 设置 TabBar 包含的所有视图
    NSArray *controllers = @[
                             @"HomeViewController",
                             @"LocationViewController",
                             @"MessageViewController",
                             @"InfoViewController"
                             ];
    
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    
    // 使用 block 方法遍历集合
    [controllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *viewController = [[NSClassFromString(obj) alloc] init];
        RootNavigationController *rootNavigationController = [[RootNavigationController alloc] initWithRootViewController:viewController];
        [viewControllers addObject:rootNavigationController];
    }];
    
    self.viewControllers = viewControllers;
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
