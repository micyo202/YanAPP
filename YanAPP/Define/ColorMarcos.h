//
//  ColorMarcos.h
//  YanAPP
//
//  Created by Apple on 2018/4/17.
//  Copyright © 2018年 Yanzheng. All rights reserved.
//

#ifndef ColorMarcos_h
#define ColorMarcos_h

#pragma mark - 颜色方法
#define RgbColor(r, g, b, a)            [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
#define HexColor(hex, a)                [UIColor colorWithHexString:hex alpha:a]

#pragma mark - 基本颜色
#define DEFAULT_BACKGROUND_COLOR        RgbColor(239.0, 239.0, 244.0, 1.0f)
#define DEFAULT_RED_COLOR               RgbColor(248.0, 97.0, 97.0, 1.0f)
#define DEFAULT_ORANGE_COLOR            RgbColor(252.0, 192.0, 21.0, 1.0f)
#define DEFAULT_BLUE_COLOR              RgbColor(24.0, 147.0, 227.0, 1.0f)
#define DEFAULT_GREEN_COLOR             RgbColor(57.0, 206.0, 159.0, 1.0f)
#define DEFAULT_LINE_GRAY_COLOR         RgbColor(188.0, 188.0, 188.0, 0.6f)

#endif /* ColorMarcos_h */
