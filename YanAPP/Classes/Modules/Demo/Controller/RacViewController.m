//
//  RacViewController.m
//  YanAPP
//
//  Created by Apple on 2018/4/28.
//  Copyright © 2018年 Yanzheng. All rights reserved.
//

#import "RacViewController.h"

@interface RacViewController ()

@end

@implementation RacViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"RAC-示例";
    
    UILabel *label = [UILabel new];
    label.text = @"使用RAC进行替换KVO监听输入框变化情况：";
    [self.view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(32);
    }];
    
    UITextField *textField = [UITextField new];
    textField.backgroundColor = UIColor.blackColor;
    textField.textColor = UIColor.whiteColor;
    [self.view addSubview:textField];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.mas_equalTo(45);
        make.height.mas_equalTo(32);
    }];
    
    // 使用RAC进行替换KVO（监听输入框值变化）
    [[textField rac_signalForControlEvents:UIControlEventEditingChanged] subscribeNext:^(__kindof UIControl * _Nullable x) {
        if([x isKindOfClass:[UITextField class]]){
            UITextField *tf = x;
            DLog("变化值为：%@", tf.text);
        }
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
