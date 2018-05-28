/************************************************************
 Class    : DemoHelper.h
 Describe : 示例模块业务处理类
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-04-28
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <Foundation/Foundation.h>

@interface DemoHelper : NSObject

SingletonH(DemoHelper)

- (void)initializeDataSuccess:(void (^)(id responseObject))success
                      failure:(void (^)(NSString *error))failure;

@end
