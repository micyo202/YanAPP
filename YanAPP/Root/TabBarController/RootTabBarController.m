/************************************************************
 Class    : RootTabBarController.h
 Describe : 根选项卡控制器，也是整个程序的root视图
 Company  : Prient
 Author   : Yanzheng 严正
 Date     : 2018-04-17
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "RootTabBarController.h"
#import "RootNavigationController.h"

#define CLASS_NAME      @"className"
#define TITLE           @"title"
#define IMAGE           @"image"
#define SELECTED_IMAGE  @"selectedImage"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

SingletonM(RootTabBarController)

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 设置 TabBar 包含的所有视图
    NSArray *items = @[
                       @{
                           CLASS_NAME       :   @"HomeViewController",
                           TITLE            :   @"首页",
                           IMAGE            :   @"tabbar_home",
                           SELECTED_IMAGE   :   @"tabbar_homeHL"
                           },
                       @{
                           CLASS_NAME       :   @"FinanceViewController",
                           TITLE            :   @"理财",
                           IMAGE            :   @"tabbar_finance",
                           SELECTED_IMAGE   :   @"tabbar_financeHL"
                           },
                       @{
                           CLASS_NAME       :   @"DiscoverViewController",
                           TITLE            :   @"发现",
                           IMAGE            :   @"tabbar_discover",
                           SELECTED_IMAGE   :   @"tabbar_discoverHL"
                           },
                       @{
                           CLASS_NAME       :   @"ServiceViewController",
                           TITLE            :   @"服务",
                           IMAGE            :   @"tabbar_service",
                           SELECTED_IMAGE   :   @"tabbar_serviceHL"
                           },
                       @{
                           CLASS_NAME       :   @"MineViewController",
                           TITLE            :   @"我的",
                           IMAGE            :   @"tabbar_mine",
                           SELECTED_IMAGE   :   @"tabbar_mineHL"
                           }
                       ];
    
    NSMutableArray *viewControllers = [NSMutableArray new];
    
    // 使用 block 方法遍历集合
    [items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *viewController = [NSClassFromString(obj[CLASS_NAME]) new];
        viewController.title = obj[TITLE];
        viewController.tabBarItem.image = [UIImage imageNamed:obj[IMAGE]];
        viewController.tabBarItem.selectedImage = [[UIImage imageNamed:obj[SELECTED_IMAGE]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        RootNavigationController *rootNavigationController = [[RootNavigationController alloc] initWithRootViewController:viewController];
        
        [viewControllers addObject:rootNavigationController];
    }];
    
    self.viewControllers = viewControllers;// 设置 tabBar 集合
    UITabBarItem *item = [UITabBarItem appearance];// 获取 tabBarItem 的外观
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName : DEFAULT_RED_COLOR} forState:UIControlStateSelected];// 设置tabBar选中颜色
    
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
