//
//  BaseWebViewController.h
//  YanAPP
//
//  Created by Apple on 2018/5/15.
//  Copyright © 2018年 Yanzheng. All rights reserved.
//

#import "RootWebViewController.h"

@interface BaseWebViewController : RootWebViewController

//在多级跳转后，是否在返回按钮右侧展示关闭按钮
@property(nonatomic,assign) BOOL isShowCloseItem;

@end
