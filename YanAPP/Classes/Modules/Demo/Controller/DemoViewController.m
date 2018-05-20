/************************************************************
 Class    : DemoViewController.m
 Describe : 示例模块视图控制器
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-04-19
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "DemoViewController.h"
#import "BaseWebViewController.h"
#import "DemoTableViewCell.h"

static NSString *const cellReuseIdentifier = @"cellReuseIdentifier";
static NSString *const cellReuseIdentifier1 = @"cellReuseIdentifier1";

@interface DemoViewController () <UITableViewDelegate, UITableViewDataSource, CustomIOSAlertViewDelegate>

@property(nonatomic, strong) NSMutableArray *data;

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Demo";
    
    _data = [[NSMutableArray alloc] init];
    [_data addObjectsFromArray:@[@"AvoidCrash-防止闪退", @"TableView-集合列表", @"CollectionView-集合列表", @"AFN-请求", @"RAC-示例", @"YYKit-组件", @"SDCycleScrollView-轮播图", @"UIAlertController+Blocks-弹框Alert", @"UIAlertController+Blocks-底部Sheet", @"CustomIOSAlertView-自定义弹框视图", @"MBProgressHUD-示例", @"WebView-示例",  @"导航栏Style-示例", @"Others-其他"]];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellReuseIdentifier];
    [self.tableView registerClass:[DemoTableViewCell class] forCellReuseIdentifier:cellReuseIdentifier1];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.mj_header.hidden = YES;
    self.tableView.mj_footer.hidden = YES;
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if(1 == indexPath.row){
        DemoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier1];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
        cell.textLabel.text = [_data objectAtIndex:indexPath.row];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //点击后将颜色变回来
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //获取点击的cell
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //逻辑判断进行相应的处理
    if([cell.textLabel.text isEqualToString:@"AvoidCrash-防止闪退"]){
        // 将nil值给Dictionary会报错
        NSString *nilStr = nil;
        NSDictionary *dictionary = @{@"字典": nilStr};
        //NSArray *array = @[@"数组", nilStr];
        DLog(@"%@",dictionary);
    } else if([cell.textLabel.text isEqualToString:@"TableView-集合列表"]){
        [self.navigationController pushViewController:[[NSClassFromString(@"TableViewController") alloc] init] animated:YES];
    } else if([cell.textLabel.text isEqualToString:@"CollectionView-集合列表"]){
        [self.navigationController pushViewController:[[NSClassFromString(@"CollectionViewController") alloc] init] animated:YES];
    } else if([cell.textLabel.text isEqualToString:@"AFN-请求"]){
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:@"http://localhost:8080/home/init" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            DLog(@"_SUCCESS \n %@", responseObject);
            for(NSString *s in responseObject){
                DLog(@"_OBJ \n %@", s);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            DLog(@"_ERROR \n %@", error);
        }];
        
    } else if([cell.textLabel.text isEqualToString:@"RAC-示例"]){
        [self.navigationController pushViewController:[[NSClassFromString(@"RacViewController") alloc] init] animated:YES];
    } else if([cell.textLabel.text isEqualToString:@"YYKit-组件"]){
        [self.navigationController pushViewController:[[NSClassFromString(@"YYViewController") alloc] init] animated:YES];
    } else if([cell.textLabel.text isEqualToString:@"SDCycleScrollView-轮播图"]){
        [self.navigationController pushViewController:[[NSClassFromString(@"CycleViewController") alloc] init] animated:YES];
    } else if([cell.textLabel.text isEqualToString:@"UIAlertController+Blocks-弹框Alert"]){
        [UIAlertController showAlertInViewController:self withTitle:@"顶部标题" message:@"详细提示信息" cancelButtonTitle:@"取消按钮" destructiveButtonTitle:@"红色按钮" otherButtonTitles:@[@"自定义按钮1", @"自定义按钮2"] tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
            DLog(@"buttonIndex = %ld", buttonIndex);
            if (buttonIndex == controller.cancelButtonIndex) {
                DLog(@"点击了取消按钮");
            } else if (buttonIndex == controller.destructiveButtonIndex) {
                DLog(@"点击了红色按钮");
            } else if (buttonIndex >= controller.firstOtherButtonIndex) {
                DLog(@"点击了自定义按钮的序列为 %ld", (long)buttonIndex - controller.firstOtherButtonIndex);
            }
        }];
    } else if([cell.textLabel.text isEqualToString:@"UIAlertController+Blocks-底部Sheet"]){
        [UIAlertController showActionSheetInViewController:self withTitle:@"顶部标题" message:@"详细提示信息" cancelButtonTitle:@"取消按钮" destructiveButtonTitle:@"红色按钮" otherButtonTitles:@[@"自定义按钮1", @"自定义按钮2"] popoverPresentationControllerBlock:^(UIPopoverPresentationController * _Nonnull popover) {
            popover.sourceView = self.view;
            popover.sourceRect = self.view.frame;
        } tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
            if (buttonIndex == controller.cancelButtonIndex) {
                DLog(@"点击了取消按钮");
            } else if (buttonIndex == controller.destructiveButtonIndex) {
                DLog(@"点击了红色按钮");
            } else if (buttonIndex >= controller.firstOtherButtonIndex) {
                DLog(@"点击了自定义按钮的序列为 %ld", (long)buttonIndex - controller.firstOtherButtonIndex);
            }
        }];
    } else if([cell.textLabel.text isEqualToString:@"CustomIOSAlertView-自定义弹框视图"]){
        CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
        UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_SCREEN/3)];
        customView.backgroundColor = UIColor.blackColor;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1508498082662&di=47a95adc26742482328425a3dd6b47b3&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F019f9c5542b8fc0000019ae980d080.jpg%401280w_1l_2o_100sh.jpg"] placeholderImage:[UIImage imageNamed:@"默认图片"]];
        [customView addSubview:imageView];
        [alertView setContainerView:customView];
        [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"立即更新", @"以后再说", nil]];
        alertView.delegate = self;
        [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
            [alertView close];
        }];
        [alertView setUseMotionEffects:true];
        [alertView show];
    } else if([cell.textLabel.text isEqualToString:@"MBProgressHUD-示例"]){
        [self.navigationController pushViewController:[[NSClassFromString(@"HudViewController") alloc] init] animated:YES];
    } else if([cell.textLabel.text isEqualToString:@"WebView-示例"]){
        //[self.navigationController pushViewController:[[NSClassFromString(@"WebViewController") alloc] init] animated:YES];
        BaseWebViewController *webVC = [[BaseWebViewController alloc] initWithUrl:@"http://www.hao123.com"];
        webVC.title = @"WebView";
        webVC.isShowCloseItem = YES;
        webVC.progressViewColor = DEFAULT_GREEN_COLOR;
        [self.navigationController pushViewController:webVC animated:YES];
    } else if([cell.textLabel.text isEqualToString:@"导航栏Style-示例"]){
        [self.navigationController pushViewController:[[NSClassFromString(@"NavigationStyleViewController") alloc] init] animated:YES];
    } else {
        DLog(@"%@", _data[indexPath.row]);
        NSDictionary *dic = [JsonUtil dictionaryOrArrayWithJSONSString:@"{\"code\":\"809\",\"name\":\"Hello World!\"}"];
        DLog(@"%@", dic);
    }
}

#pragma mark - 重写方法
- (void)headerRefreshing{
    DLog(@"开始执行顶部Header刷新方法");
    // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 结束刷新
        [self.tableView.mj_header endRefreshing];
    });
}

- (void)footerRefreshing{
    DLog(@"开始执行底部Footer刷新方法");
    // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 结束刷新
        [self.tableView.mj_footer endRefreshing];
    });
}

#pragma mark - CustomIOSAlertViewDelegate
- (void)customIOS7dialogButtonTouchUpInside:(id)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    DLog(@"点击了 %ld", buttonIndex);
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
