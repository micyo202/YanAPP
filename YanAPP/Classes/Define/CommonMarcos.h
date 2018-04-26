/************************************************************
 Class    : CommonMarcos.h
 Describe : 通用宏
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-04-19
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#ifndef CommonMarcos_h
#define CommonMarcos_h

// 强弱引用
//强弱引用
#define WeakSelf(type)  __weak typeof(type) weak##type = type;
#define StrongSelf(type) __strong typeof(type) type = weak##type;

// 在控制台输出Log日志
#ifdef  DEBUG
#define DLog(FORMAT, ...) NSLog((@"Yan [Debug Log]%s [Line %d] " FORMAT), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DLog(...)
#endif

// 单例模式方法
#define SingletonH(name) + (instancetype)shared##name;

#define SingletonM(name) \
static id _instance; \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}\
\
- (id)mutableCopyWithZone:(NSZone *)zone { \
return _instance; \
}

#endif /* CommonMarcos_h */
