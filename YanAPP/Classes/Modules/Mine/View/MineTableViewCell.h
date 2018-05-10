/************************************************************
 Class    : MineTableViewCell.h
 Describe : 我的模块TableViewCell视图
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-05-02
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <UIKit/UIKit.h>
#import "MineModel.h"

typedef NS_ENUM(NSInteger, CellLineStyle) {
    CellLineStyleDefault,
    CellLineStyleFill,
    CellLineStyleNone,
};

@protocol MineTableViewCellDelegate <NSObject>

@optional
- (void)mineTableViewCellButtonAction:(UIButton *)sender;   // button点击代理方法
- (void)mineTableViewCellSwitchAction:(UISwitch *)sender;   // switch开关变更方法

@end

@interface MineTableViewCell : UITableViewCell

@property (nonatomic, assign) CellLineStyle bottomLineStyle;    // 底部线条样式
@property (nonatomic, assign) CellLineStyle topLineStyle;       // 顶部线条样式


@property (nonatomic, strong) MineModelItem *item;

+ (CGFloat)getHeightForText:(MineModelItem *)item;

@property (nonatomic, weak) id<MineTableViewCellDelegate> delegate;

@end
