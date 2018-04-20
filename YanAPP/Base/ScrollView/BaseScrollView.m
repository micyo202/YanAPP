/************************************************************
 Class    : BaseScrollView.m
 Describe : 基本的滚动视图，带边缘回弹效果
 Company  : Prient
 Author   : Yanzheng 严正
 Date     : 2018-04-19
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "BaseScrollView.h"

@implementation BaseScrollView

#pragma mark - 初始化，默认大小为Screen屏幕大小
- (instancetype)init {
    return [self initWithFrame:FRAME_SCREEN];
}

#pragma mark - 根据传入 frame 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = DEFAULT_BACKGROUND_COLOR;
        
        //通过width,height，来确定显示的内容的区域的大小。只要其大小超过scrollView自身的大小，就能产生滑动
        CGFloat width = CGRectGetWidth(frame);
        CGFloat height = CGRectGetHeight(frame);
        self.contentSize = CGSizeMake(width, height);
        
        //设置不在动偏移，默认YES
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        //通过设置pagingEnabled这个属性，可以控制scrollView的子视图按整屏翻动，默认为NO
        //self.pagingEnabled = YES;
        //通过修改contenOffset这个属性，让区域内容(子视图)按照偏移量的大小来进行显示。
        //self.contentOffset = CGPointMake(CGRectGetWidth(self.bounds)*0, 0);
        //滑动视图的边界回弹效果，默认为YES，表示开启动画，设置为NO时，当滑动到边缘就是无效果
        //self.bounces = NO;
        //设置横向滑动的指示器（滚动条）是否显示,默认为YES
        //self.showsHorizontalScrollIndicator = NO;
        //设置纵向滑动的指示器（滚动条）的显示，默认为YES
        //self.showsVerticalScrollIndicator = NO;
        //锁定滑动方向(当系统识别滚动方向的时候，会把另外一个方向锁定，如果识别不了，就不锁定方向)默认NO
        self.directionalLockEnabled = YES;
        //默认是NO，当设置为YES时，可以运行content小于scrollView边界的回弹效果
        //self.alwaysBounceHorizontal = YES; // 水平方向滑动回弹
        self.alwaysBounceVertical = YES;  // 垂直方向滑动回弹
        //设置tag值 作用是如果和UIPageControl搭配使用 用Tag值来相互关联
        //self.tag = 1;
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
