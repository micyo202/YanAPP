/************************************************************
 Class    : GeneralViewController.m
 Describe : 通用各种样式列表案例
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-05-09
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "GeneralViewController.h"
#import "MineManager.h"

@interface GeneralViewController ()

@end

@implementation GeneralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"所有样式";
    self.data = [[MineManager sharedMineManager] generalData];
}

#pragma mark - cell点击方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    DLog(@"indexPath = (section:%ld, row:%ld)", indexPath.section, indexPath.row);
}

#pragma mark - 代理方法
- (void)mineTableViewCellSwitchAction:(UISwitch *)sender {
    DLog(@"sender.tag = %ld，是否开启：%@", sender.tag, sender.on ? @"YES" : @"NO");
}

- (void)mineTableViewCellButtonAction:(UISwitch *)sender {
    DLog(@"button.tag = %ld", (long)sender.tag);
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
