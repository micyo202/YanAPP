/************************************************************
 Class    : ScreenMarcos.h
 Describe : 屏幕尺寸宏
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-04-19
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#ifndef ScreenMarcos_h
#define ScreenMarcos_h

#define FRAME_SCREEN            UIScreen.mainScreen.bounds
#define WIDTH_SCREEN            UIScreen.mainScreen.bounds.size.width
#define HEIGHT_SCREEN           UIScreen.mainScreen.bounds.size.height
#define HEIGTH_STATUS_BAR       UIApplication.sharedApplication.statusBarFrame.size.height
#define HEIGHT_NAVIGATION_BAR   44.0f
#define HEIGHT_TAB_BAR          (UIApplication.sharedApplication.statusBarFrame.size.height>20?83:49)
#define HEIGHT_TOP              (HEIGTH_STATUS_BAR + HEIGHT_NAVIGATION_BAR)

#endif /* ScreenMarcos_h */
