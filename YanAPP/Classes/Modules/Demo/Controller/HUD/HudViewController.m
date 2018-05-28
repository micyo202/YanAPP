/************************************************************
 Class    : HudViewController.m
 Describe : 提示框HUD示例
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-05-04
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "HudViewController.h"

@interface HudViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) NSArray *data;

@end

@implementation HudViewController

static NSString *const cellReuseIdentifier = @"cellReuseIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"ProgressHUD";
    
    /*
    //两个按钮的父类view
    UIView *rightButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    
    //历史浏览按钮
    UIButton *historyBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [rightButtonView addSubview:historyBtn];
    [historyBtn setImage:[UIImage imageNamed:@"navigation_back_black"] forState:UIControlStateNormal];
    [historyBtn addTarget:self action:@selector(historyBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    
    //主页搜索按钮
    UIButton *mainAndSearchBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 0, 50, 50)];
    [rightButtonView addSubview:mainAndSearchBtn];
    [mainAndSearchBtn setImage:[UIImage imageNamed:@"navigation_close_black"] forState:UIControlStateNormal];
    [mainAndSearchBtn addTarget:self action:@selector(mainAndSearchBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    
    //把右侧的两个按钮添加到rightBarButtonItem
    UIBarButtonItem *rightCunstomButtonView = [[UIBarButtonItem alloc] initWithCustomView:rightButtonView];
    self.navigationItem.leftBarButtonItem = rightCunstomButtonView;
    */
    
    // 添加两个按钮
    //UIBarButtonItem *myButton = [[UIBarButtonItem alloc] initWithTitle:@"主页" style:UIBarButtonItemStylePlain target:self action:@selector(clickEvent)];
    //self.navigationItem.backBarButtonItem = myButton;
    
    _data = @[
              @"window弹框有字提示-0",
              @"view弹框有字提示-1",
              @"window等待有字提示-2",
              @"view等待有字提示-3",
              @"window纯菊花等待-4",
              @"view纯菊花等待-5",
              @"✅成功提示-6",
              @"⚠️警告提示-7",
              @"❌错误提示-8",
              @"🆕信息提示-9"
              ];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellReuseIdentifier];
    self.tableView.mj_header.hidden = YES;
    self.tableView.mj_footer.hidden = YES;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
    cell.textLabel.text = [_data objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    switch (indexPath.row) {
        case 0:
            [MBProgressHUD showTipMessageInWindow:@"window上提示"];
            break;
        case 1:
            [MBProgressHUD showTipMessageInView:@"view上弹框提示"];
            break;
        case 2:
            [MBProgressHUD showActivityMessageInWindow:@"window等待小菊花"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUD];
            });
            break;
        case 3:
            [MBProgressHUD showActivityMessageInView:@"view等待小菊花" timer:3.f];
            break;
        case 4:
            [MBProgressHUD showActivityMessageInWindow:@"" timer:3.f];
            break;
        case 5:
            [MBProgressHUD showActivityMessageInView:@"" timer:3.f];
            break;
        case 6:
            [MBProgressHUD showSuccessMessage:@"成功提示"];
            break;
        case 7:
            [MBProgressHUD showWarnMessage:@"警告提示"];
            break;
        case 8:
            [MBProgressHUD showErrorMessage:@"错误提示"];
            break;
        case 9:
            [MBProgressHUD showInfoMessage:@"信息提示框"];
            break;
        default:
            break;
    }
    
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
