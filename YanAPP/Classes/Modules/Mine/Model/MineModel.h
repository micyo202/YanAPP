//
//  MineModel.h
//  YanAPP
//
//  Created by Apple on 2018/4/30.
//  Copyright © 2018年 Yanzheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineModelItem : NSObject

/************************ 属性 ************************/
// 1 左边图标（主图片）
@property (nonatomic, copy) NSString *imageName;
//@property (nonatomic, strong) NSURL *imageURL;
// 2 标题
@property (nonatomic, copy) NSString *title;
// 3.1 中间图片
@property (nonatomic, copy) NSString *middleImageName;
//@property (nonatomic, strong) NSURL *middlerImageURL;
// 3.2 图片集
@property (nonatomic, strong) NSArray *subImages;
// 4 副标题
@property (nonatomic, copy) NSString *subTitle;
// 5 右图片
@property (nonatomic, copy) NSString *rightImageName;
//@property (nonatomic, strong) NSURL *rightImageURL;
// 6 btton、switch的标签tag
@property (nonatomic, assign) NSInteger tag;
// 7 设置switch的值
@property (nonatomic, assign) BOOL isOn;

@end

@interface MineModelGroup : NSObject

@end
