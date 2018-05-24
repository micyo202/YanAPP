/************************************************************
 Class    : AdvertHelper.h
 Describe : 启动广告页处理类
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-05-23
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <Foundation/Foundation.h>
#import "AdvertView.h"

@interface AdvertHelper : NSObject

SingletonH(AdvertHelper)

+ (void)showAdvertView:(NSArray<NSString *> *)imageArray;

@end
