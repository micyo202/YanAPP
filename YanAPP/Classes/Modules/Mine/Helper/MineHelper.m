/************************************************************
 Class    : MineHelper.h
 Describe : 我的模块业务处理类
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-05-02
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "MineHelper.h"
#import "MineModel.h"

@implementation MineHelper

SingletonM(MineHelper)

#pragma mark - 我的模块基本数据（第一级）
- (NSMutableArray *)infoData {
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
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
    
    MineModelItem *general = [MineModelItem createWithImageName:@"mine_general" title:@"所有样式"];
    
    MineModelGroup *group5 = [[MineModelGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:general, nil];
    [items addObject:group5];
    
    return items;
    
}

#pragma mark - 设置信息数据
- (NSMutableArray *)settingData {
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    MineModelItem *recNoti = [MineModelItem createWithTitle:@"接收新消息通知" subTitle:@"已开启"];
    recNoti.accessoryType = UITableViewCellAccessoryNone;
    MineModelGroup *group1 = [[MineModelGroup alloc] initWithHeaderTitle:nil footerTitle:[NSString stringWithFormat:@"如果你要关闭或开启\"%@\"的新消息通知，请在iPhone的\"设置\"-\"通知\"功能中，找到应用程序\"%@\"更改。", AppName, AppName] settingItems:recNoti, nil];
    [items addObject:group1];
    
    // 获取声音、震动、更新设置的值
    MineModelItem *voice = [MineModelItem createWithTitle:@"声音"];
    voice.type = MineModelItemTypeSwitch;
    voice.tag = 452;
    voice.on = YES;
    MineModelItem *shake = [MineModelItem createWithTitle:@"震动"];
    shake.type = MineModelItemTypeSwitch;
    shake.tag = 453;
    shake.on = NO;
    MineModelGroup *group2 = [[MineModelGroup alloc] initWithHeaderTitle:nil footerTitle:[NSString stringWithFormat:@"当\"%@\"在运行时，你可以设置是否需要声音或者振动。", AppName] settingItems:voice, shake, nil];
    [items addObject:group2];
    
    MineModelItem *sysVoice = [MineModelItem createWithTitle:@"应用特效"];
    sysVoice.type = MineModelItemTypeSwitch;
    sysVoice.tag = 454;
    sysVoice.on = NO;
    MineModelGroup *group3 = [[MineModelGroup alloc] initWithHeaderTitle:nil footerTitle:@"包括刷新、点击按钮时反馈的音效及动画" settingItems: sysVoice, nil];
    [items addObject:group3];
    
    MineModelItem *clear = [MineModelItem createWithTitle:@"清理缓存" subTitle:@"66.9MB"];
    clear.accessoryType = UITableViewCellAccessoryNone;
    MineModelGroup *group5 = [[MineModelGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems: clear, nil];
    [items addObject:group5];
    
    return items;
    
}

#pragma mark - 通用数据
- (NSMutableArray *)generalData {
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    MineModelItem *titleItem = [MineModelItem createWithTitle:@"只有标题-标准"];
    MineModelItem *titleItem1 = [MineModelItem createWithTitle:@"主标题-标准" subTitle:@"子标题"];
    MineModelItem *titleItem2 = [MineModelItem createWithTitle:@"主标题-居中" subTitle:@"子标题"];
    titleItem2.alignment = MineModelItemAlignmentMiddle;
    MineModelItem *titleItem3 = [MineModelItem createWithTitle:@"只有标题-标准1"];
    titleItem3.accessoryType = UITableViewCellAccessoryNone;
    MineModelItem *titleItem4 = [MineModelItem createWithTitle:@"主标题-标准1" subTitle:@"子标题"];
    titleItem4.accessoryType = UITableViewCellAccessoryNone;
    MineModelItem *titleItem5 = [MineModelItem createWithTitle:@"主标题-居中1" subTitle:@"子标题"];
    titleItem5.titleColor = DEFAULT_RED_COLOR;
    titleItem5.alignment = MineModelItemAlignmentMiddle;
    
    MineModelGroup *group1 = [[MineModelGroup alloc] initWithHeaderTitle:nil footerTitle:@"第一个分组底部标题" settingItems:titleItem, titleItem1, titleItem2, titleItem3, titleItem4, titleItem5, nil];
    [items addObject:group1];
    
    MineModelItem *imageItem = [MineModelItem createWithImageName:@"mine_test" title:@"图标样式1"];
    MineModelItem *imageItem1 = [MineModelItem createWithImageName:@"mine_test" title:@"图标样式2" middleImageName:@"mine_safe" subTitle:@"子标题"];
    MineModelItem *imageItem2 = [MineModelItem createWithImageName:@"mine_test" title:@"图标样式3" subTitle:@"子标题" rightImageName:@"mine_safe"];
    MineModelItem *imageItem3 = [MineModelItem createWithImageName:@"mine_test" title:@"图标样式4" middleImageName:@"mine_safe" subTitle:@"子标题" rightImageName:@"mine_about"];
    
    MineModelItem *imageItem4 = [MineModelItem createWithImageName:@"mine_test" title:@"图标样式5"];
    imageItem4.accessoryType = UITableViewCellAccessoryNone;
    MineModelItem *imageItem5 = [MineModelItem createWithImageName:@"mine_test" title:@"图标样式6" middleImageName:@"mine_safe" subTitle:@"子标题"];
    imageItem5.accessoryType = UITableViewCellAccessoryNone;
    MineModelItem *imageItem6 = [MineModelItem createWithImageName:@"mine_test" title:@"图标样式7" subTitle:@"子标题" rightImageName:@"mine_safe"];
    imageItem6.accessoryType = UITableViewCellAccessoryNone;
    MineModelItem *imageItem7 = [MineModelItem createWithImageName:@"mine_test" title:@"图标样式8" middleImageName:@"mine_safe" subTitle:@"子标题" rightImageName:@"mine_about"];
    imageItem7.accessoryType = UITableViewCellAccessoryNone;
    
    MineModelGroup *group2 = [[MineModelGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:imageItem, imageItem1, imageItem2, imageItem3, imageItem4, imageItem5, imageItem6, imageItem7, nil];
    [items addObject:group2];
    
    MineModelItem *switchItem = [MineModelItem createWithTitle:@"Switch开关按钮"];
    switchItem.type = MineModelItemTypeSwitch;
    
    MineModelGroup *group3 = [[MineModelGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:switchItem, nil];
    [items addObject:group3];
    
    MineModelItem *buttonItem = [MineModelItem createWithTitle:@"Button按钮"];
    buttonItem.type = MineModelItemTypeButton;
    MineModelGroup *group4 = [[MineModelGroup alloc] initWithHeaderTitle:@"第三个分组头部内容" footerTitle:@"第三个分组底部内容" settingItems:buttonItem, nil];
    [items addObject:group4];
    
    return items;
    
}

@end
