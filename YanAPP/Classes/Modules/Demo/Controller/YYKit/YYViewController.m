/************************************************************
 Class    : YYViewController.m
 Describe : YYKit组件示例
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-04-28
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "YYViewController.h"

@interface YYViewController ()

@end

@implementation YYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"YYKit-组件";
    
    YYLabel *yyLabel = [[YYLabel alloc] init];
    yyLabel.text = @"YYLabel查询数据";
    yyLabel.textAlignment = NSTextAlignmentCenter;
    yyLabel.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    
    WeakSelf(yyLabel);
    yyLabel.textTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        StrongSelf(yyLabel)
        yyLabel.text = @"YYLabel查询完毕";
    };
    
    [self.view addSubview:yyLabel];
    
    [yyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(32);
    }];
    
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
