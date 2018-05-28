/************************************************************
 Class    : DemoHelper.m
 Describe : 示例模块业务处理类
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-04-28
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "DemoHelper.h"

@implementation DemoHelper

SingletonM(DemoHelper)

- (void)initializeDataSuccess:(void (^)(id))success
                      failure:(void (^)(NSString *))failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:@"http://localhost:8080/home/init" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error.localizedDescription);
    }];
}

@end
