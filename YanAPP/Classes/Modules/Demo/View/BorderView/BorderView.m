/************************************************************
 Class    : BorderView.m
 Describe : 边线视图
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-05-25
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "BorderView.h"

@implementation BorderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        [self initializeAppearance];
    }
    return self;
}

- (void)initializeAppearance {
    self.backgroundColor = UIColor.clearColor;
    _borderWidth = 0.3f;
    _dashPattern = 2;
    _spacePattern = 1;
    _borderType = BorderViewTypeDashed;
}

- (void)drawRect:(CGRect)rect {
    if (_shapeLayer) [_shapeLayer removeFromSuperlayer];
    CGFloat cornerRadius = _cornerRadius;
    CGFloat borderWidth = _borderWidth;
    CGFloat dashPattern = _dashPattern;
    CGFloat spacePattern = _spacePattern;
    UIColor *borderColor = _borderColor ? _borderColor : [UIColor blackColor];
    CGRect frame = self.bounds;
    
    _shapeLayer = [CAShapeLayer layer];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, frame.size.height - cornerRadius);
    CGPathAddLineToPoint(path, NULL, 0, cornerRadius);
    
    CGPathAddArc(path, NULL, cornerRadius, cornerRadius, cornerRadius, M_PI, -M_PI_2, NO);
    CGPathAddLineToPoint(path, NULL, frame.size.width - cornerRadius, 0);
    CGPathAddArc(path, NULL, frame.size.width - cornerRadius, cornerRadius, cornerRadius, -M_PI_2, 0, NO);
    CGPathAddLineToPoint(path, NULL, frame.size.width, frame.size.height-cornerRadius);
    CGPathAddArc(path, NULL, frame.size.width - cornerRadius, frame.size.height - cornerRadius, cornerRadius, 0, M_PI_2, NO);
    CGPathAddLineToPoint(path, NULL, cornerRadius, frame.size.height);
    CGPathAddArc(path, NULL, cornerRadius, frame.size.height - cornerRadius, cornerRadius, M_PI_2, M_PI, NO);
    
    _shapeLayer.path = path;
    _shapeLayer.backgroundColor = [UIColor clearColor].CGColor;
    _shapeLayer.frame = frame;
    _shapeLayer.masksToBounds = NO;
    [_shapeLayer setValue:[NSNumber numberWithBool:NO] forKey:@"isCircle"];
    _shapeLayer.fillColor = [UIColor clearColor].CGColor;
    _shapeLayer.strokeColor = [borderColor CGColor];
    _shapeLayer.lineWidth = borderWidth;
    _shapeLayer.lineDashPattern = _borderType == BorderViewTypeDashed ? [NSArray arrayWithObjects:[NSNumber numberWithInt:dashPattern],[NSNumber numberWithInt:spacePattern] ,nil] : nil;
    _shapeLayer.lineCap = kCALineCapRound;
    [self.layer addSublayer:_shapeLayer];
    self.layer.cornerRadius = cornerRadius;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
