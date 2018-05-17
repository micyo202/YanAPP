//
//  NavigationStyleViewController.m
//  YanAPP
//
//  Created by Apple on 2018/5/17.
//  Copyright © 2018年 Yanzheng. All rights reserved.
//

#import "NavigationStyleViewController.h"

@interface NavigationStyleViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *data;

@end

@implementation NavigationStyleViewController

static NSString *const cellReuseIdentifier = @"cellReuseIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"导航栏样式";
    
    _data = @[@"白色样式", @"隐藏导航栏", @"透明导航栏", @"其他颜色导航栏"];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellReuseIdentifier];
    self.tableView.mj_header.hidden = YES;
    self.tableView.mj_footer.hidden = YES;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
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
    if([@"白色样式" isEqualToString:_data[indexPath.row]]){
        [self.navigationController pushViewController:[[NSClassFromString(@"NavigationWhiteViewController") alloc] init] animated:YES];
    } else if([@"隐藏导航栏" isEqualToString:_data[indexPath.row]]){
        [self.navigationController pushViewController:[[NSClassFromString(@"NavigationHiddenViewController") alloc] init] animated:YES];
    } else if([@"透明导航栏" isEqualToString:_data[indexPath.row]]){
        [self.navigationController pushViewController:[[NSClassFromString(@"NavigationAlphaViewController") alloc] init] animated:YES];
    } else {
        [self.navigationController pushViewController:[[NSClassFromString(@"NavigationOtherViewController") alloc] init] animated:YES];
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
