/************************************************************
 Class    : RootViewController.m
 Describe : 根视图控制器，所有视图控制器必须继承于该类
 Company  : Prient
 Author   : Yanzheng 严正
 Date     : 2018-04-17
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置根视图基本的背景色
    self.view.backgroundColor = DEFAULT_BACKGROUND_COLOR;
    
    [self initialize];// 初始化基本内容
    
    [self initializeNavigation];// 初始化导航栏样式
    
}

#pragma mark - 初始化基本的参数内容
- (void)initialize {
    
    /**
     * 默认 YES：视图自动偏移，设置为NO视图不进行偏移
     *
     * iOS11之前可使用此方法，之后使用 UIScrollView's contentInsetAdjustmentBehavior
     */
    //self.automaticallyAdjustsScrollViewInsets = NO;
    
    /**
     * 默认 NO：空出导航栏位置，YES：视图延伸到屏幕边缘
     *
     * 如果状态栏是不透明的，那么页面的布局默认是不会包含状态栏的，除非将这个属性设置成为YES
     * 所以如果你的页面扩展到NavigationBar(edgesForExtendedLayout = UIRectEdgeAll)，要是这个属性设置成NO(默认), 如果状态栏是不透明的话，页面是不会扩展到状态栏的
     */
    //self.extendedLayoutIncludesOpaqueBars = YES;
    
    /**
     * 默认 UIRectEdgeAll 视图部延伸到顶部导航栏下，UIRectEdgeNone 视图部延伸到顶部导航栏下
     *
     * 当导航栏是半透明效果的情况下，设置此属性可控制视图是否延伸到顶部导航栏下方
     */
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    
}

#pragma mark - 初始化导航栏样式
- (void)initializeNavigation {
    
    self.navigationController.navigationBar.barTintColor = DEFAULT_BACKGROUND_COLOR;// 设置导航栏背景颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];// 设置导航栏 itemBar 字体颜色
    self.navigationController.navigationBar.translucent = NO;// 半透明效果，默认 YES
    //self.navigationController.navigationBar.clipsToBounds = YES;// 隐藏导航栏分割线
    //[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation_background"] forBarMetrics:UIBarMetricsDefault];// 导航栏背景图
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:RgbColor(255, 255, 255, 0)]];  // 导航栏分割线颜色
    self.navigationController.navigationBar.titleTextAttributes = @{ NSForegroundColorAttributeName : [UIColor whiteColor] };// 设置导航栏字体颜色
    
}

#pragma mark - 自定义设置导航栏返回按钮样式（可在子类视图控制中进行重写）
- (UIBarButtonItem *)rt_customBackItemWithTarget:(id)target action:(SEL)action {
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"navigation_back_black"] forState:UIControlStateNormal];
    [backBtn sizeToFit];
    [backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    
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
