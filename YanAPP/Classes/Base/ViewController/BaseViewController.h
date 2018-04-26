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
#import <RTRootNavigationController.h>

@interface BaseViewController : UIViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UICollectionView *collectionView;

@end
