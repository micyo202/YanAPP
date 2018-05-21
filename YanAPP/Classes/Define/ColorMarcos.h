/************************************************************
 Class    : ColorMarcos.h
 Describe : 色彩宏
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-04-17
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#ifndef ColorMarcos_h
#define ColorMarcos_h

#pragma mark - 颜色方法
#define RgbColor(r, g, b, a)            [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
#define HexColor(hex, a)                [UIColor colorWithHexString:hex alpha:a]
#define RandomColor                     RgbColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#pragma mark - 基本颜色
#define DEFAULT_BACKGROUND_COLOR        RgbColor(239.0, 239.0, 244.0, 1.0f)
#define DEFAULT_LINE_GRAY_COLOR         RgbColor(188.0, 188.0, 188.0, 0.6f)

#define DEFAULT_ORANGE_COLOR            HexColor(@"#eebf5c", 1.0f)
#define DEFAULT_BLUE_COLOR              HexColor(@"#7bbce7", 1.0f)
#define DEFAULT_GREEN_COLOR             HexColor(@"#71d47e", 1.0f)
#define DEFAULT_RED_COLOR               HexColor(@"#f0695a", 1.0f)
#define DEFAULT_YELLOW_COLOR            HexColor(@"#f9d969", 1.0f)
#define DEFAULT_PURPLE_COLOR            HexColor(@"#9086ef", 1.0f)
#define DEFAULT_CYAN_COLOR              HexColor(@"#76dfd5", 1.0f)

#endif /* ColorMarcos_h */
