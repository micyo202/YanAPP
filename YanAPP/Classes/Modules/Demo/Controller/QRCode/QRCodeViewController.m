//
//  QRCodeViewController.m
//  YanAPP
//
//  Created by Apple on 2018/5/29.
//  Copyright © 2018年 Yanzheng. All rights reserved.
//

#import "QRCodeViewController.h"
#import <SGQRCode.h>

@interface QRCodeViewController () <UITableViewDelegate, UITableViewDataSource, CustomIOSAlertViewDelegate>

@property (nonatomic, strong) NSArray *data;

@end

@implementation QRCodeViewController

static NSString *const cellReuseIdentifier = @"cellReuseIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellReuseIdentifier];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.mj_header.hidden = YES;
    self.tableView.mj_footer.hidden = YES;
    [self.view addSubview:self.tableView];
    _data = @[@"二维码生成", @"二维码扫描"];
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
    NSInteger row = indexPath.row;
    
    if(0 == row){
        // 二维码生成
        CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
        UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN - 100, WIDTH_SCREEN - 100)];
        customView.backgroundColor = UIColor.whiteColor;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, customView.width, customView.width)];
        imageView.image = [SGQRCodeGenerateManager generateWithDefaultQRCodeData:@"https://github.com/micyo202" imageViewWidth:WIDTH_SCREEN - 60];
        [customView addSubview:imageView];
        [alertView setContainerView:customView];
        [alertView setButtonTitles:[NSMutableArray arrayWithObjects: @"分享", nil]];
        alertView.delegate = self;
        [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
            [alertView close];
        }];
        [alertView setUseMotionEffects:true];
        [alertView show];
        
    }
    if(1 == row){
        // 二维码扫描
        [self.navigationController pushViewController:[[NSClassFromString(@"ScanViewController") alloc] init] animated:YES];
    }
    
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
