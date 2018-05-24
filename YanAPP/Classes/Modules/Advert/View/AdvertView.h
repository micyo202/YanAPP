/************************************************************
 Class    : AdvertView.h
 Describe : 启动广告页视图
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-05-23
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *const NotificationContants_Advert_Key;

@interface AdvertView : UIView

// 显示广告页面方法
- (void)show;

// 图片路径
@property (nonatomic, copy) NSString *filePath;

@end
