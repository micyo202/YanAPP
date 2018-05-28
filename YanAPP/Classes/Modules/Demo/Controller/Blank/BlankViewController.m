/************************************************************
 Class    : BlankViewController.m
 Describe : 空白视图控制器，用于跳转测试
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-05-10
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "BlankViewController.h"

@interface BlankViewController ()

@end

@implementation BlankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"空白页";
    self.view.backgroundColor = RandomColor;
    [self wr_setNavBarBarTintColor:RandomColor];
    
    // 添加导航栏右侧按钮
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"首页" style:UIBarButtonItemStylePlain target:self action:@selector(popAction:)];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"点击push下一个界面" forState:UIControlStateNormal];
    btn.backgroundColor = RandomColor;
    [btn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 36));
    }];
    
}

- (void)popAction:(UIBarButtonItem *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)btnClick:(UIButton *)sender {
    [self.navigationController pushViewController:[[BlankViewController alloc] init] animated:YES];
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
