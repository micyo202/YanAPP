/************************************************************
 Class    : MineHelper.h
 Describe : 我的模块业务处理类
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-05-02
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <Foundation/Foundation.h>

@interface MineHelper : NSObject

SingletonH(MineHelper)

// 我的模块基本数据（第一级）
- (NSMutableArray *)infoData;

- (NSMutableArray *)settingData;

- (NSMutableArray *)generalData;

@end
