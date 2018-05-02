/************************************************************
 Class    : MineManager.m
 Describe : 我的模块业务管理类
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-05-02
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "MineManager.h"
#import "MineModel.h"

@implementation MineManager

SingletonM(MineManager)

#pragma mark - 我的数据（第一级）
- (NSMutableArray *)mineData {
    
    NSMutableArray *items = [NSMutableArray array];
    
    MineModelItem *safe = [MineModelItem createWithImageName:@"mine_safe" title:@"安全中心"];
    MineModelItem *schedule = [MineModelItem createWithImageName:@"mine_schedule" title:@"我的日程"];
    MineModelItem *service = [MineModelItem createWithImageName:@"mine_service" title:@"我的客服"];
    
    MineModelGroup *group1 = [[MineModelGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:safe, schedule, service, nil];
    [items addObject:group1];
    
    MineModelItem *setting = [MineModelItem createWithImageName:@"mine_setting" title:@"设置"];
    
    MineModelGroup *group2 = [[MineModelGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:setting, nil];
    [items addObject:group2];
    
    MineModelItem *opinion = [MineModelItem createWithImageName:@"mine_evaluate" title:@"系统评价"];
    MineModelItem *about = [MineModelItem createWithImageName:@"mine_about" title:@"关于"];
    
    MineModelGroup *group3 = [[MineModelGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:opinion, about, nil];
    [items addObject:group3];
    
    MineModelItem *test = [MineModelItem createWithImageName:@"mine_test" title:@"测试"];
     
    MineModelGroup *group4 = [[MineModelGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:test, nil];
    [items addObject:group4];
    
    return items;
    
}

@end
