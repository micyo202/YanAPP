//
//  DemoTableViewCell.m
//  YanAPP
//
//  Created by Apple on 2018/5/20.
//  Copyright © 2018年 Yanzheng. All rights reserved.
//

#import "DemoTableViewCell.h"

@implementation DemoTableViewCell{
    UIButton *firstBtn;
    UIButton *secondBtn;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.backgroundColor = UIColor.whiteColor;
        
        firstBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        firstBtn.backgroundColor = UIColor.redColor;
        [firstBtn setTitle:@"第一个按钮" forState:UIControlStateNormal];
        firstBtn.frame = CGRectMake(10, 10, self.width/2 - 10, self.height-20);
        [firstBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:firstBtn];
        
    }
    return self;
}

- (void)btnAction:(UIButton *)sender{
    DLog(@"你抓不住我吧，哈哈哈哈哈😄");
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
