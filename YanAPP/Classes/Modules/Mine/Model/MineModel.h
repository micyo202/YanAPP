/************************************************************
 Class    : MineModel.h
 Describe : 我的模块数据模型
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-04-30
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <Foundation/Foundation.h>

#pragma mark - 自定义枚举类型
#pragma mark 对齐方式ENUM
typedef NS_ENUM(NSInteger, MineModelItemAlignment) {
    MineModelItemAlignmentLeft,
    MineModelItemAlignmentRight,
    MineModelItemAlignmentMiddle
};

#pragma mark 类型ENUM
typedef NS_ENUM(NSInteger, MineModelItemType) {
    MineModelItemTypeDefault,   // image, title, rightTitle, rightImage
    MineModelItemTypeButton,    // button
    MineModelItemTypeSwitch     // title， switch
};

@interface MineModelItem : NSObject

// 对齐方式
@property (nonatomic, assign) MineModelItemAlignment alignment;
// 类型
@property (nonatomic, assign) MineModelItemType type;

/************************ 属性 ************************/
// 1 左边图标（主图片）
@property (nonatomic, copy) NSString *imageName;
//@property (nonatomic, strong) NSURL *imageURL;
// 2 标题
@property (nonatomic, copy) NSString *title;
// 3.1 中间图片
@property (nonatomic, copy) NSString *middleImageName;
//@property (nonatomic, strong) NSURL *middlerImageURL;
// 3.2 图片集
@property (nonatomic, strong) NSArray *subImages;
// 4 副标题
@property (nonatomic, copy) NSString *subTitle;
// 5 右图片
@property (nonatomic, copy) NSString *rightImageName;
//@property (nonatomic, strong) NSURL *rightImageURL;
// 6 btton、switch的标签tag
@property (nonatomic, assign) NSInteger tag;
// 7 设置switch的值
@property (nonatomic, assign, getter=isOn) BOOL on;

/************************ 样式 ************************/
@property (nonatomic, assign) UITableViewCellAccessoryType accessoryType;
@property (nonatomic, assign) UITableViewCellSelectionStyle selectionStyle;

@property (nonatomic, strong) UIColor *bgColor;
@property (nonatomic, strong) UIColor *btnBGColor;
@property (nonatomic, strong) UIColor *btnTitleColor;

@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIFont *titleFont;

@property (nonatomic, strong) UIColor *subTitleColor;
@property (nonatomic, strong) UIFont *subTitleFont;

@property (nonatomic, assign) CGFloat rightImageHeightOfCell;
@property (nonatomic, assign) CGFloat middleImageHeightOfCell;

/************************ 类方法 ************************/
+ (MineModelItem *) createWithTitle:(NSString *)title;
+ (MineModelItem *) createWithImageName:(NSString *)imageName title:(NSString *)title;
+ (MineModelItem *) createWithTitle:(NSString *)title subTitle:(NSString *)subTitle;
+ (MineModelItem *) createWithImageName:(NSString *)imageName title:(NSString *)title middleImageName:(NSString *)middleImageName subTitle:(NSString *)subTitle;
+ (MineModelItem *) createWithImageName:(NSString *)imageName title:(NSString *)title subTitle:(NSString *)subTitle rightImageName:(NSString *)rightImageName;
+ (MineModelItem *) createWithImageName:(NSString *)imageName title:(NSString *)title middleImageName:(NSString *)middleImageName subTitle:(NSString *)subTitle rightImageName:(NSString *)rightImageName;

@end

@interface MineModelGroup : NSObject

/************************ 属性 ************************/
// 组头部标题
@property (nonatomic, copy) NSString *headerTitle;
// 组尾部说明
@property (nonatomic, copy) NSString *footerTitle;
// 组元素
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, assign, readonly) NSUInteger itemsCount;

/************************ 类方法 ************************/
- (MineModelGroup *) initWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle settingItems:(MineModelItem *)firstObj, ...;
- (MineModelItem *) itemAtIndex:(NSUInteger)index;

@end
