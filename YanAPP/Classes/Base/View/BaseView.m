//
//  BaseView.m
//  YanAPP
//
//  Created by Apple on 2018/4/25.
//  Copyright © 2018年 Yanzheng. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)init {
    return [self initWithFrame:FRAME_SCREEN];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = DEFAULT_BACKGROUND_COLOR;
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
