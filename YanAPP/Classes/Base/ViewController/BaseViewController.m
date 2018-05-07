/************************************************************
 Class    : BaseViewController.m
 Describe : 基础的图控制器，所有视图控制器必须继承于该类
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-04-17
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

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
    
    self.navigationController.navigationBar.barTintColor = DEFAULT_ORANGE_COLOR;// 设置导航栏背景颜色
    self.navigationController.navigationBar.tintColor = UIColor.whiteColor;// 设置导航栏 itemBar 字体颜色
    self.navigationController.navigationBar.translucent = NO;// 半透明效果，默认 YES
    //[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation_background"] forBarMetrics:UIBarMetricsDefault];// 导航栏背景图
    //self.navigationController.navigationBar.hidden = YES;// 隐藏导航栏
    //self.navigationController.navigationBar.clipsToBounds = YES;// 隐藏导航栏分割线
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:HexColor(@"#FFFFFF", .0F)]];  // 导航栏分割线颜色
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

#pragma mark - 初始化ScrollView
- (UIScrollView *)scrollView {
    
    if(nil == _scrollView){
        
        _scrollView = [[UIScrollView alloc] initWithFrame:FRAME_SCREEN];
        _scrollView.backgroundColor = DEFAULT_BACKGROUND_COLOR;
        
        //通过width,height，来确定显示的内容的区域的大小。只要其大小超过scrollView自身的大小，就能产生滑动
        CGFloat width = CGRectGetWidth(FRAME_SCREEN);
        CGFloat height = CGRectGetHeight(FRAME_SCREEN);
        _scrollView.contentSize = CGSizeMake(width, height);
        
        //设置不在动偏移，默认YES
        _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        //通过设置pagingEnabled这个属性，可以控制scrollView的子视图按整屏翻动，默认为NO
        //_scrollView.pagingEnabled = YES;
        //通过修改contenOffset这个属性，让区域内容(子视图)按照偏移量的大小来进行显示。
        //_scrollView.contentOffset = CGPointMake(CGRectGetWidth(_scrollView.bounds)*0, 0);
        //滑动视图的边界回弹效果，默认为YES，表示开启动画，设置为NO时，当滑动到边缘就是无效果
        //_scrollView.bounces = NO;
        //设置横向滑动的指示器（滚动条）是否显示,默认为YES
        //_scrollView.showsHorizontalScrollIndicator = NO;
        //设置纵向滑动的指示器（滚动条）的显示，默认为YES
        //_scrollView.showsVerticalScrollIndicator = NO;
        //锁定滑动方向(当系统识别滚动方向的时候，会把另外一个方向锁定，如果识别不了，就不锁定方向)默认NO
        _scrollView.directionalLockEnabled = YES;
        //默认是NO，当设置为YES时，可以运行content小于scrollView边界的回弹效果
        //_scrollView.alwaysBounceHorizontal = YES; // 水平方向滑动回弹
        _scrollView.alwaysBounceVertical = YES;  // 垂直方向滑动回弹
        //设置tag值 作用是如果和UIPageControl搭配使用 用Tag值来相互关联
        //_scrollView.tag = 1;
    }
    
    return _scrollView;
    
}

#pragma mark - 初始化TableView
- (UITableView *)tableView {
    
    if(nil == _tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_SCREEN - HEIGHT_TOP) style:UITableViewStylePlain];
        _tableView.backgroundColor = DEFAULT_BACKGROUND_COLOR;
        //_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;// 隐藏自带的分割线
        _tableView.separatorInset = UIEdgeInsetsZero;// 设置分割线位置，UIEdgeInsetsZero：左侧右侧没有间距
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];// 去除底部多余分割线
        // 关闭默认的预估高度效果
        _tableView.estimatedRowHeight = 0;// 行高度
        _tableView.estimatedSectionHeaderHeight = 0;// 头视图高度
        _tableView.estimatedSectionFooterHeight = 0;// 脚视图高度
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
        //_tableView.contentSize = SIZE_SCREEN; // 视图可滚动的区域
        //_tableView.contentOffset = CGPointZero;   // 显示区域顶点相对于frame的偏移量
        //_tableView.contentInset = UIEdgeInsetsMake(0, 0, HEIGHT_TAB_BAR, 0); // 内容区域域偏移位置
        
        // 顶部刷新
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
        header.automaticallyChangeAlpha = YES;
        header.lastUpdatedTimeLabel.hidden = YES;
        //header.stateLabel.hidden = YES;
        _tableView.mj_header = header;

        // 底部刷新
        MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshing)];
        _tableView.mj_footer = footer;
        
    }
    
    return _tableView;
    
}

#pragma mark - 初始化CollectionView
- (UICollectionView *)collectionView {
    
    if(nil == _collectionView){
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        //flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;// 确定是水平滚动，还是垂直滚动
        //flowLayout.minimumLineSpacing = 0;
        //flowLayout.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN , HEIGHT_SCREEN - HEIGHT_TOP) collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = DEFAULT_BACKGROUND_COLOR;
        
        // 顶部刷新
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
        header.automaticallyChangeAlpha = YES;
        header.lastUpdatedTimeLabel.hidden = YES;
        //header.stateLabel.hidden = YES;
        _collectionView.mj_header = header;
        
        // 底部刷新
        MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshing)];
        _collectionView.mj_footer = footer;
        
    }
    
    return _collectionView;
    
}

#pragma mark - 顶部刷新方法
- (void)headerRefreshing {
    //顶部刷新方法，下拉刷新（需子类重写）
}

#pragma mark - 底部刷新方法
- (void)footerRefreshing {
    //底部刷新方法，上拉加载更多（需子类重写）
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
