//
//  DemoViewController.m
//  YanAPP
//
//  Created by Apple on 2018/4/19.
//  Copyright © 2018年 Yanzheng. All rights reserved.
//

#import "DemoViewController.h"
#import "DemoTableViewCell.h"

static NSString *const cellReuseIdentifier = @"tableViewCell";

@interface DemoViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) NSArray *data;

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Demo";
    
    _data = @[@"AvoidCrash-防止闪退", @"AFN-请求", @"RAC-示例", @"YYKit-组件", @"Others-其他"];
    
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[DemoTableViewCell class] forCellReuseIdentifier:cellReuseIdentifier];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    DemoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
    cell.titleLabel.text = [_data objectAtIndex:indexPath.row];
    cell.detailLabel.text = @"XX";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //点击后将颜色变回来
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //获取点击的cell
    DemoTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //逻辑判断进行相应的处理
    if([cell.titleLabel.text isEqualToString:@"AvoidCrash-防止闪退"]){
        // 将nil值给Dictionary会报错
        NSString *nilStr = nil;
        NSDictionary *dictionary = @{@"字典": nilStr};
        //NSArray *array = @[@"数组", nilStr];
        DLog(@"%@",dictionary);
    } else if([cell.titleLabel.text isEqualToString:@"AFN-请求"]){
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:@"http://localhost:8080/home/init" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            DLog(@"_SUCCESS \n %@", responseObject);
            for(NSString *s in responseObject){
                DLog(@"_OBJ \n %@", s);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            DLog(@"_ERROR \n %@", error);
        }];
        
    } else if([cell.titleLabel.text isEqualToString:@"RAC-示例"]){

        [self.navigationController pushViewController:[NSClassFromString(@"RacViewController") new] animated:YES];
        
    } else if([cell.titleLabel.text isEqualToString:@"YYKit-组件"]){
        
        [self.navigationController pushViewController:[NSClassFromString(@"YYViewController") new] animated:YES];
        
    } else {
        DLog(@"%@", _data[indexPath.row]);
        NSDictionary *dic = [JsonUtil dictionaryOrArrayWithJSONSString:@"{\"code\":\"809\",\"name\":\"Hello World!\"}"];
        DLog(@"%@", dic);
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
