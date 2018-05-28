/************************************************************
 Class    : TableViewController.m
 Describe : Table样式视图控制器示例
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-05-04
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "TableViewController.h"

@interface TableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation TableViewController

static NSString *const cellReuseIdentifier = @"cellReuseIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"TableView";
    
    _data = [[NSMutableArray alloc] init];
    int a = 0;
    while (a < 30) {
        a++;
        [_data addObject:[NSString stringWithFormat:@"随机数据-%d", arc4random_uniform(999)]];
    }
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellReuseIdentifier];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

// 滑动视图，移动隐藏导航栏效果开始 Start
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self setNavigationBarTransformProgress:0];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 0){
        [UIView animateWithDuration:0.3 animations:^{
            [self setNavigationBarTransformProgress:1];
        }];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            [self setNavigationBarTransformProgress:0];
        }];
    }
}

- (void)setNavigationBarTransformProgress:(CGFloat)progress{
    [self.navigationController.navigationBar wr_setTranslationY:(-HEIGHT_NAVIGATION_BAR * progress)];
    // 有系统的返回按钮，所以 hasSystemBackIndicator = YES
    [self.navigationController.navigationBar wr_setBarButtonItemsAlpha:(1 - progress) hasSystemBackIndicator:YES];
}

// 滑动视图，移动隐藏导航栏效果结束 End

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
    //cell.backgroundColor = RandomColor;
    cell.textLabel.text = [_data objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //点击后将颜色变回来
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DLog(@"点击cell的序列值为：%ld", indexPath.row);
}

- (void)headerRefreshing{
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

- (void)footerRefreshing{
    DLog(@"开始执行底部Footer刷新方法");
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

