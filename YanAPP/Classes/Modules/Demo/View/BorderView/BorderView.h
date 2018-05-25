/************************************************************
 Class    : BorderView.h
 Describe : 边线视图
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-05-25
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import <UIKit/UIKit.h>

typedef enum BorderViewType {
    BorderViewTypeDashed,
    BorderViewTypeSolid
} BorderViewType;

@interface BorderView : UIView

@property (nonatomic, assign) BorderViewType borderType;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) NSUInteger dashPattern;
@property (nonatomic, assign) NSUInteger spacePattern;
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end
