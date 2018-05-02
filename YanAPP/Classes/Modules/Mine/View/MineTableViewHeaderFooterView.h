/************************************************************
 Class    : MineTableViewHeaderFooterView.h
 Describe : 我的模块头部底部视图
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-05-02
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <UIKit/UIKit.h>

@interface MineTableViewHeaderFooterView : UITableViewHeaderFooterView

@property (nonatomic, copy) NSString *text;

+ (CGFloat) getHeightForText:(NSString *)text;

@end
