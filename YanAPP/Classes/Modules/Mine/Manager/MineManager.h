/************************************************************
 Class    : MineManager.h
 Describe : 我的模块业务管理类
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-05-02
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <Foundation/Foundation.h>

@interface MineManager : NSObject

SingletonH(MineManager)

// 我的数据（第一级）
- (NSMutableArray *)mineData;

@end
