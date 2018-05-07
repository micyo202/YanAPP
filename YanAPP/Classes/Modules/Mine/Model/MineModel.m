/************************************************************
 Class    : MineModel.m
 Describe : 我的模块数据模型
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-04-30
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "MineModel.h"

@implementation MineModelItem

#pragma mark 初始化方法
- (instancetype) init{
    if (self = [super init]) {
        self.alignment = MineModelItemAlignmentRight;
        
        self.bgColor = [UIColor whiteColor];
        self.titleColor = [UIColor blackColor];
        self.subTitleColor = [UIColor grayColor];
        self.titleFont = [UIFont systemFontOfSize:17.0f];
        self.subTitleFont = [UIFont systemFontOfSize:15.0f];
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.rightImageHeightOfCell = 0.72f;
        self.middleImageHeightOfCell = 0.35f;
    }
    return self;
}

#pragma mark 创建item的各种方法
+ (MineModelItem *) createWithTitle:(NSString *)title{
    return [MineModelItem createWithImageName:nil title:title];
}

+ (MineModelItem *) createWithImageName:(NSString *)imageName title:(NSString *)title{
    return [MineModelItem createWithImageName:imageName title:title subTitle:nil rightImageName:nil];
}

+ (MineModelItem *) createWithTitle:(NSString *)title subTitle:(NSString *)subTitle{
    return [MineModelItem createWithImageName:nil title:title subTitle:subTitle rightImageName:nil];
}

+ (MineModelItem *) createWithImageName:(NSString *)imageName title:(NSString *)title middleImageName:(NSString *)middleImageName subTitle:(NSString *)subTitle{
    return [MineModelItem createWithImageName:imageName title:title middleImageName:middleImageName subTitle:subTitle rightImageName:nil];
}

+ (MineModelItem *) createWithImageName:(NSString *)imageName title:(NSString *)title subTitle:(NSString *)subTitle rightImageName:(NSString *)rightImageName{
    return [MineModelItem createWithImageName:imageName title:title middleImageName:nil subTitle:subTitle rightImageName:rightImageName];
}

+ (MineModelItem *) createWithImageName:(NSString *)imageName title:(NSString *)title middleImageName:(NSString *)middleImageName subTitle:(NSString *)subTitle rightImageName:(NSString *)rightImageName{
    MineModelItem *item = [[MineModelItem alloc] init];
    item.imageName = imageName;
    item.middleImageName = middleImageName;
    item.rightImageName = rightImageName;
    item.title = title;
    item.subTitle = subTitle;
    return item;
}

#pragma mark - 设置对齐方式
- (void) setAlignment:(MineModelItemAlignment)alignment{
    _alignment = alignment;
    if (alignment == MineModelItemAlignmentMiddle) {
        self.accessoryType = UITableViewCellAccessoryNone;
    }
}

#pragma mark - 设置类型
- (void) setType:(MineModelItemType)type{
    _type = type;
    if (type == MineModelItemTypeSwitch) {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else if (type == MineModelItemTypeButton) {
        self.btnBGColor = DEFAULT_RED_COLOR;
        self.btnTitleColor = [UIColor whiteColor];
        self.accessoryType = UITableViewCellAccessoryNone;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.bgColor = [UIColor clearColor];
    }
}

@end

@implementation MineModelGroup

#pragma mark 初始化一个组
- (instancetype) initWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle settingItems:(MineModelItem *)firstObj, ...{
    if (self = [super init]) {
        _headerTitle = headerTitle;
        _footerTitle = footerTitle;
        _items = [[NSMutableArray alloc] init];
        va_list argList;
        if (firstObj) {
            [_items addObject:firstObj];
            va_start(argList, firstObj);
            id arg;
            while ((arg = va_arg(argList, id))) {
                [_items addObject:arg];
            }
            va_end(argList);
        }
    }
    return self;
}

#pragma mark 根据下标获取对象
- (MineModelItem *) itemAtIndex:(NSUInteger)index{
    return [_items objectAtIndex:index];
}

#pragma mark 获取每组中对象的个数
- (NSUInteger) itemsCount{
    return self.items.count;
}

@end
