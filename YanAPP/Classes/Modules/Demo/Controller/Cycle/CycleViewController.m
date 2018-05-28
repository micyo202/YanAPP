/************************************************************
 Class    : CycleViewController.m
 Describe : 轮播图示例
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-05-10
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "CycleViewController.h"

@interface CycleViewController () <SDCycleScrollViewDelegate>

@end

@implementation CycleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"轮播图";
    
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    
    NSArray *titles = @[
                        @"网络图第一张",
                        @"2张网络加载图",
                        @"这是最后一张网络加载图"
                        ];
    
    // 网络加载图片的轮播器
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 180.f) delegate:self placeholderImage:[UIImage imageNamed:@"默认图"]];
    cycleScrollView.imageURLStringsGroup = imagesURLStrings;    // 图片地址数组
    cycleScrollView.titlesGroup = titles;   // 标题数组
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;   // 设置pageControl居右，默认居中
    cycleScrollView.autoScrollTimeInterval = 2.f;   // 自定义轮播时间间隔，默认1.f
    
    [self.scrollView addSubview:cycleScrollView];
    
    cycleScrollView.clickItemOperationBlock = ^(NSInteger index) {
        DLog(@">>>>>  %ld", (long)index);
    };
    
    
    NSArray *imagesStrings = @[
                               @"cycle_image_1",
                               @"cycle_image_2",
                               @"cycle_image_3"
                               ];
    
    // 本地加载图片的轮播器
    SDCycleScrollView *cycleScrollView1 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 200, WIDTH_SCREEN, 180.f) imageNamesGroup:imagesStrings];
    cycleScrollView1.titlesGroup = titles;   // 标题数组
    cycleScrollView1.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;   // 设置pageControl居右，默认居中
    cycleScrollView1.autoScrollTimeInterval = 4.f;   // 自定义轮播时间间隔，默认1.f
    
    [self.scrollView addSubview:cycleScrollView1];
    
    [self.view addSubview:self.scrollView];
    
    //SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 200, WIDTH_SCREEN, 180.f) imagesGroup:图片数组];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
