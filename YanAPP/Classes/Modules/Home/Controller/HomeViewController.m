/************************************************************
 Class    : HomeViewController.m
 Describe : 首页模块视图控制器
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-04-17
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "HomeViewController.h"

@interface HomeViewController ()

@property(nonatomic, strong) UIButton *btn;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"首页(2)";
    
    [self.scrollView addSubview:self.btn];
    /*
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(scrollView);
        make.centerY.equalTo(scrollView).offset(-200);
    }];
    */
    self.btn.frame = CGRectMake(10, 10, 200, 36);
    
    [self.view addSubview:self.scrollView];

}

- (UIButton *)btn{
    if(nil == _btn){
        _btn = [UIButton buttonWithType:UIButtonTypeSystem];
        _btn.backgroundColor = DEFAULT_YELLOW_COLOR;
        [_btn setTitle:@"push到Demo界面" forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

- (void)btnClick:(UIButton *)sender{
    [self.navigationController pushViewController:[[NSClassFromString(@"DemoViewController") alloc] init] animated:YES];
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
