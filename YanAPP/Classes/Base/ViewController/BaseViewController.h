/************************************************************
 Class    : BaseViewController.h
 Describe : 基础的图控制器，所有视图控制器必须继承于该类
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-04-17
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <UIKit/UIKit.h>
#import <WRNavigationBar.h>
#import "AppDelegate.h"
#import "AppDelegate+AppService.h"

@interface BaseViewController : UIViewController

@property (nonatomic, assign) BOOL isWhiteNavigationBar;    // 导航栏是否为白色

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UICollectionView *collectionView;

/**
 * 导航栏添加文本按钮（自定义导航栏按钮）
 *
 * @param titles 文本数组
 * @param isLeft 是否是左边 非左即右
 * @param target 目标
 * @param action 点击方法
 * @param tags tags数组 回调区分用
 */
- (void)addNavigationItemWithTitles:(NSArray *)titles isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags;

/**
 * 导航栏添加图片按钮（自定义导航栏按钮）
 *
 * @param imageNames 图标数组
 * @param isLeft 是否是左边 非左即右
 * @param target 目标
 * @param action 点击方法
 * @param tags tags数组 回调区分用
 */
- (void)addNavigationItemWithImageNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action tags:(NSArray *)tags;

// 返回按钮点击方法
- (void)backBtnClicked;

@end
