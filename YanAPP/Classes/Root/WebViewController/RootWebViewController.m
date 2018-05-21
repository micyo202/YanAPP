//
//  RootWebViewController.m
//  YanAPP
//
//  Created by Apple on 2018/5/15.
//  Copyright © 2018年 Yanzheng. All rights reserved.
//

#import "RootWebViewController.h"

@interface RootWebViewController () <WKNavigationDelegate>

//@property (nonatomic,strong) XLJSHandler * jsHandler;
@property (nonatomic,assign) double lastProgress;//上次进度条位置

@end

@implementation RootWebViewController

- (instancetype)initWithUrl:(NSString *)url {
    self = [super init];
    if (self) {
        self.url = url;
        _progressViewColor = DEFAULT_ORANGE_COLOR;
    }
    return self;
}

- (void)setUrl:(NSString *)url {
    if (_url != url) {
        _url = url;
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:_url]];
        //加密header部分
        //NSString *headerContentStr = [[HeaderModel new] modelToJSONString];
        //NSString *headerAESStr = aesEncrypt(headerContentStr);
        //[request setValue:headerAESStr forHTTPHeaderField:@"header-encrypt-code"];
        [self.webView loadRequest:request];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initWKWebView];
    //self.webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    
}

#pragma mark 初始化webview
-(void)initWKWebView {
    WKWebViewConfiguration * configuration = [[WKWebViewConfiguration alloc]init];
    configuration.preferences.javaScriptEnabled = YES;//打开js交互
    _webConfiguration = configuration;
    //_jsHandler = [[XLJSHandler alloc]initWithViewController:self configuration:configuration];
    
    CGRect f = FRAME_SCREEN;
    if (self.navigationController) {
        f = CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_SCREEN - HEIGHT_TOP);
    }
    
    self.webView = [[WKWebView alloc]initWithFrame:f configuration:configuration];
    _webView.navigationDelegate = self;
    _webView.backgroundColor = [UIColor clearColor];
    _webView.allowsBackForwardNavigationGestures=YES;//打开网页间的 滑动返回
    _webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
    //监控进度
    [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [self.view addSubview:_webView];
    //进度条
    _progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    _progressView.tintColor = _progressViewColor;
    _progressView.trackTintColor = UIColor.clearColor;
    _progressView.frame = CGRectMake(0, HEIGHT_TOP, WIDTH_SCREEN, 3.0);
    [_webView addSubview:_progressView];
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:_url]];
    //加密header部分
    //NSString *headerContentStr = [[HeaderModel new] modelToJSONString];
    //NSString *headerAESStr = aesEncrypt(headerContentStr);
    //[request setValue:headerAESStr forHTTPHeaderField:@"header-encrypt-code"];
    [_webView loadRequest:request];
}

#pragma mark --进度条
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    [self updateProgress:_webView.estimatedProgress];
}

#pragma mark -  更新进度条
-(void)updateProgress:(double)progress{
    self.progressView.alpha = 1;
    if(progress > _lastProgress){
        [self.progressView setProgress:self.webView.estimatedProgress animated:YES];
    }else{
        [self.progressView setProgress:self.webView.estimatedProgress];
    }
    _lastProgress = progress;
    
    if (progress >= 1) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.progressView.alpha = 0;
            [self.progressView setProgress:0];
            self.lastProgress = 0;
        });
    }
}

#pragma mark --navigation delegate
//加载完毕
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    self.title = webView.title;
    [self updateProgress:webView.estimatedProgress];
    
    [self updateNavigationItems];
}

-(void)updateNavigationItems{
    // 更新导航栏按钮，子类去实现
}

-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    if(webView != self.webView) {
        decisionHandler(WKNavigationActionPolicyAllow);
        return;
    }
    //更新返回按钮
    [self updateNavigationItems];
    
    NSURL * url = webView.URL;
    //打开wkwebview禁用了电话和跳转appstore 通过这个方法打开
    UIApplication *app = [UIApplication sharedApplication];
    if ([url.scheme isEqualToString:@"tel"]) {
        if ([app canOpenURL:url]) {
            [app openURL:url options:@{} completionHandler:nil];
            decisionHandler(WKNavigationActionPolicyCancel);
            return;
        }
    }
    if ([url.absoluteString containsString:@"itunes.apple.com"]) {
        if ([app canOpenURL:url]) {
            [app openURL:url options:@{} completionHandler:nil];
            decisionHandler(WKNavigationActionPolicyCancel);
            return;
        }
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

#pragma mark - 返回按钮点击事件
-(void)backBtnClicked{
    [self.webView stopLoading];
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }else{
        [super backBtnClicked];
    }
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

-(void)dealloc {
    //[_jsHandler cancelHandler];
    self.webView.navigationDelegate = nil;
    [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

@end
