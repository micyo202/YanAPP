/************************************************************
 Class    : LocationViewController.m
 Describe : 位置模块视图控制器
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-05-11
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "LocationViewController.h"

@interface LocationViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) NSMutableArray *data;

@end

@implementation LocationViewController

static NSString *const cellReuseIdentifier = @"cellReuseIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"位置";
    
    // 设置小红点角标
    self.navigationController.tabBarItem.badgeValue = @"1";
    
    _data = [[NSMutableArray alloc] init];
    int i = 0;
    while (i < 30) {
        [_data addObject:[NSString stringWithFormat:@"随机数据-%d", arc4random_uniform(999)]];
        i++;
    }
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellReuseIdentifier];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //self.tableView.mj_header.hidden = YES;
    //self.tableView.mj_footer.hidden = YES;
    self.tableView.tableHeaderView = self.cycleScrollView;
    self.tableView.contentInset = UIEdgeInsetsMake(-HEIGHT_TOP, 0, 0, 0);//等价于self.tableView.mj_insetT = -HEIGHT_TOP;
    if(iPhoneX)
        self.tableView.mj_header.mj_h = HEIGHT_TOP;
    [self.view addSubview:self.tableView];
    
    // 设置初始导航栏透明度
    [self wr_setNavBarBackgroundAlpha:0];
    // 设置导航栏按钮和标题颜色
    [self wr_setNavBarTintColor:[UIColor whiteColor]];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 200-HEIGHT_TOP*2)
    {
        [self changeNavBarAnimateWithIsClear:NO];
        self.navigationItem.title = @"位置(1)";
    }
    else
    {
        [self changeNavBarAnimateWithIsClear:YES];
        self.navigationItem.title = @"";
    }
}

- (void)changeNavBarAnimateWithIsClear:(BOOL)isClear
{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.6 animations:^
     {
         __strong typeof(self) pThis = weakSelf;
         if (isClear == YES) {
             [pThis wr_setNavBarBackgroundAlpha:0];
         } else {
             [pThis wr_setNavBarBackgroundAlpha:1.0];
         }
     }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
    cell.textLabel.text = _data[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [self.navigationController pushViewController:[[NSClassFromString(@"BlankViewController") alloc] init] animated:YES];
}

- (SDCycleScrollView *)cycleScrollView {
    NSArray *images = @[
                        @"cycle_image_1",
                        @"cycle_image_2",
                        @"cycle_image_3"
                        ];
    NSArray *titles = @[
                        @"腾讯",
                        @"百度",
                        @"阿里巴巴"
                        ];
    
    // 本地加载图片的轮播器
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, -200.f, WIDTH_SCREEN, 200.f) imageNamesGroup:images];
    cycleScrollView.titlesGroup = titles;   // 标题数组
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;   // 设置pageControl居右，默认居中
    cycleScrollView.autoScrollTimeInterval = 1.f;   // 自定义轮播时间间隔，默认1.f
    
    return cycleScrollView;
}

- (void)headerRefreshing {
    DLog(@"开始执行顶部Header刷新方法");
    [self.data removeAllObjects];
    WeakSelf(self)
    // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        StrongSelf(self)
        int a = 0;
        while (a < 30) {
            a++;
            [self.data addObject:[NSString stringWithFormat:@"随机数据-%d", arc4random_uniform(999)]];
        }
        [self.tableView reloadData];
        
        // 结束刷新
        [self.tableView.mj_header endRefreshing];
    });
}

- (void)footerRefreshing {
    DLog(@"开始执行顶部Header刷新方法");
    WeakSelf(self)
    // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        StrongSelf(self)
        int a = 0;
        while (a < 5) {
            a++;
            [self.data addObject:[NSString stringWithFormat:@"随机数据-%d", arc4random_uniform(999)]];
        }
        [self.tableView reloadData];
        
        // 结束刷新
        [self.tableView.mj_footer endRefreshing];
    });
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
