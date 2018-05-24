/************************************************************
 Class    : AdvertHelper.m
 Describe : 启动广告页处理类
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-05-23
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "AdvertHelper.h"

static NSString *const adImageName = @"adImageName";

@implementation AdvertHelper

SingletonM(AdvertHelper)

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(adClick:) name:NotificationContants_Advert_Key object:nil];
    }
    return self;
}

+ (void)showAdvertView:(NSArray<NSString *> *)imageArray {
    // 1.判断沙盒中是否存在广告图片，如果存在，直接显示
    NSString *filePath = [[AdvertHelper sharedAdvertHelper] getFilePathWithImageName:[NSUserDefaults.standardUserDefaults valueForKey:adImageName]];
    
    BOOL isExist = [[AdvertHelper sharedAdvertHelper] isFileExistWithFilePath:filePath];
    if (isExist) {// 图片存在
        AdvertView *advertView = [[AdvertView alloc] initWithFrame:UIScreen.mainScreen.bounds];
        advertView.filePath = filePath;
        [advertView show];
    }
    
    // 2.无论沙盒中是否存在广告图片，都需要重新调用广告接口，判断广告是否更新
    [[AdvertHelper sharedAdvertHelper] getAdvertisingImage:imageArray];
}


/**
 *  初始化广告页面
 */
- (void)getAdvertisingImage:(NSArray<NSString *> *)imageArray {
    //随机取一张
    NSString *imageUrl = imageArray[arc4random() % imageArray.count];
    NSArray *stringArr = [imageUrl componentsSeparatedByString:@"/"];
    NSString *imageName = stringArr.lastObject;
    
    // 拼接沙盒路径
    NSString *filePath = [self getFilePathWithImageName:imageName];
    BOOL isExist = [self isFileExistWithFilePath:filePath];
    if (!isExist){// 如果该图片不存在，则删除老图片，下载新图片
        [self downloadAdImageWithUrl:imageUrl imageName:imageName];
    }
}

/**
 *  判断文件是否存在
 */
- (BOOL)isFileExistWithFilePath:(NSString *)filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDirectory = FALSE;
    return [fileManager fileExistsAtPath:filePath isDirectory:&isDirectory];
}


/**
 *  下载新图片
 */
- (void)downloadAdImageWithUrl:(NSString *)imageUrl imageName:(NSString *)imageName {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        NSString *filePath = [self getFilePathWithImageName:imageName]; // 保存文件的名称
        
        if ([data writeToFile:filePath atomically:YES]) {// 保存成功
            DLog(@"保存成功");
            [self deleteOldImage];
            [NSUserDefaults.standardUserDefaults setValue:imageName forKey:adImageName];
            [NSUserDefaults.standardUserDefaults synchronize];
            // 如果有广告链接，将广告链接也保存下来
        }else{
            DLog(@"保存失败");
        }
        
    });
}

/**
 *  删除旧图片
 */
- (void)deleteOldImage {
    NSString *imageName = [NSUserDefaults.standardUserDefaults valueForKey:adImageName];
    if (imageName) {
        NSString *filePath = [self getFilePathWithImageName:imageName];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager removeItemAtPath:filePath error:nil];
    }
}

/**
 *  根据图片名拼接文件路径
 */
- (NSString *)getFilePathWithImageName:(NSString *)imageName {
    if (imageName) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
        NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:imageName];
        return filePath;
    }
    return nil;
}

//NotificationContants_Advert_Key
- (void)adClick:(NSNotificationCenter *)notic {
    NSString *url = @"https://github.com/micyo202";
    if (url != nil) {
        if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:url]]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:@{} completionHandler:^(BOOL success) {
                DLog(@"%@", success ? @"YES" : @"NO");
            }];
        }
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
