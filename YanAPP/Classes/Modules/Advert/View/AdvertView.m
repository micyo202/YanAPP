/************************************************************
 Class    : AdvertView.h
 Describe : 启动广告页视图
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-05-23
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "AdvertView.h"

NSString *const NotificationContants_Advert_Key = @"NotificationContants_Advert_Key";

@interface AdvertView()

@property (nonatomic, strong) YYAnimatedImageView *adView;
@property (nonatomic, strong) UIButton *countBtn;
@property (nonatomic, assign) NSUInteger count;

@property (nonatomic, strong) dispatch_source_t gcdTimer;

@end

//广告显示的时间
static const NSUInteger showtime = 5;

@implementation AdvertView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        // 1.广告图片
        _adView = [[YYAnimatedImageView alloc] initWithFrame:frame];
        _adView.userInteractionEnabled = YES;
        _adView.contentMode = UIViewContentModeScaleAspectFill;
        _adView.clipsToBounds = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToAd)];
        [_adView addGestureRecognizer:tap];
        
        // 2.跳过按钮
        CGFloat btnW = 60;
        CGFloat btnH = 30;
        _countBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth - btnW - 24, [UIApplication sharedApplication].statusBarFrame.size.height + btnH, btnW, btnH)];
        [_countBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [_countBtn setTitle:[NSString stringWithFormat:@"跳过%zd", showtime] forState:UIControlStateNormal];
        _countBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_countBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _countBtn.backgroundColor = [UIColor colorWithRed:38 /255.0 green:38 /255.0 blue:38 /255.0 alpha:0.6];
        _countBtn.layer.cornerRadius = 4;
        
        [self addSubview:_adView];
        [self addSubview:_countBtn];
        
    }
    return self;
}

- (void)setFilePath:(NSString *)filePath {
    _filePath = filePath;
    _adView.image = [YYImage imageWithContentsOfFile:filePath];
}

- (void)pushToAd {
    [self dismiss];
    [[NSNotificationCenter defaultCenter] postNotificationName:NotificationContants_Advert_Key object:nil userInfo:nil];
}

- (void)show {
    // 倒计时方法1：GCD
    [self startCoundown];
    [WINDOW addSubview:self];
}

// GCD倒计时
- (void)startCoundown {
    __block int timeout = showtime + 1; //倒计时时间 + 1
    WeakSelf(self);
    // GCD 定时器
    self.gcdTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(self.gcdTimer, dispatch_time(DISPATCH_TIME_NOW, 0), 1 * NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(self.gcdTimer, ^{
        if(timeout <= 0){ //倒计时结束，关闭
            [weakself dismiss];
        }else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self->_countBtn setTitle:[NSString stringWithFormat:@"跳过%d",timeout] forState:UIControlStateNormal];
            });
            timeout--;
        }
    });
    dispatch_resume(self.gcdTimer);
}

// 移除广告页面
- (void)dismiss {
    if (_gcdTimer) {
        dispatch_cancel(_gcdTimer);
    }
    _gcdTimer = nil;
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.3f animations:^{
            self.alpha = 0.f;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
        
    });
}

- (void)dealloc {
    _gcdTimer = nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
