/************************************************************
 Class    : UIColor+YZ.h
 Describe : 自定义UIColor扩展类
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-04-20
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <UIKit/UIKit.h>

@interface UIColor (YZ)

// 根据16进制颜色代码生成颜色
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
