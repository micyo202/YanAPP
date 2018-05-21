/************************************************************
 Class    : ScreenMarcos.h
 Describe : 工具类宏
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-04-20
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#ifndef UtilsMarcos_h
#define UtilsMarcos_h

#define APPLICATION     UIApplication.sharedApplication
#define DELEGATE        UIApplication.sharedApplication.delegate
#define WINDOW          UIApplication.sharedApplication.delegate.window

#define InfoDictionary  NSBundle.mainBundle.infoDictionary
#define AppName         [InfoDictionary objectForKey:@"CFBundleDisplayName"]
#define AppVersion      [InfoDictionary objectForKey:@"CFBundleShortVersionString"]
#define AppBuildVersion [InfoDictionary objectForKey:@"CFBundleVersion"]

#endif /* UtilsMarcos_h */
