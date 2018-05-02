/************************************************************
 Class    : MineTableViewCell.m
 Describe : 我的模块TableViewCell视图
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-05-02
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "MineTableViewCell.h"
#import "MineModel.h"

@interface MineTableViewCell ()

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, assign) float leftFreeSpace;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;

@property (nonatomic, strong) UIImageView *mainImageView;
@property (nonatomic, strong) UIImageView *middleImageView;
@property (nonatomic, strong) UIImageView *rightImageView;

@property (nonatomic, strong) UISwitch *cSwitch;
@property (nonatomic, strong) UIButton *cButton;

@property (nonatomic, strong) NSMutableArray *subImageArray;

@end

@implementation MineTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        _topLineStyle = CellLineStyleNone;
        _bottomLineStyle = CellLineStyleDefault;
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.subTitleLabel];
        
        [self addSubview:self.mainImageView];
        [self addSubview:self.middleImageView];
        [self addSubview:self.rightImageView];
        
        [self addSubview:self.cSwitch];
        [self addSubview:self.cButton];
    }
    return self;
}

#pragma mark - 初始化样式
- (void) layoutSubviews{
    [super layoutSubviews];
    
    [self.topLine setOriginY:0];
    [self.bottomLine setOriginY:self.height - _bottomLine.height];
    [self setBottomLineStyle:_bottomLineStyle];
    [self setTopLineStyle:_topLineStyle];
    
    self.leftFreeSpace = self.width * 0.05;
    float spaceX = self.leftFreeSpace;
    
    if (self.item.type == MineModelItemTypeButton) {
        float buttonX = self.width * 0.04;
        float buttonY = self.height * 0.09;
        float buttonWidth = self.width - buttonX * 2;
        float buttonHeight = self.height - buttonY * 2;
        [self.cButton setFrame:CGRectMake(buttonX, 0, buttonWidth, buttonHeight)];
        return;
    }
    
    float x = spaceX;
    float y = self.height * 0.22;
    float h = self.height - y * 2;
    y -= 0.25;      // 补线高度差
    CGSize size;
    
    // Main Image
    if (self.item.imageName) {
        [self.mainImageView setFrame:CGRectMake(x, y, h, h)];
        x += h + spaceX;
    }
    // Title
    if (self.item.title) {
        size = [self.titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
        if (self.item.alignment == MineModelItemAlignmentMiddle) {
            [self.titleLabel setFrame:CGRectMake((self.width - size.width) * 0.5, y, size.width, h)];
        }
        else {
            [self.titleLabel setFrame:CGRectMake(x, y - 0.5, size.width, h)];
        }
    }
    
    if (self.item.alignment == MineModelItemAlignmentRight) {
        float rx = self.width - (self.item.accessoryType == UITableViewCellAccessoryDisclosureIndicator ? 35 : 10);
        
        if (self.item.type == MineModelItemTypeSwitch) {
            float cx = rx - self.cSwitch.width / 1.7;
            [self.cSwitch setCenter:CGPointMake(cx, self.height / 2.0)];
            rx -= self.cSwitch.width - 5;
        }
        
        if (self.item.rightImageName) {
            float mh = self.height * self.item.rightImageHeightOfCell;
            float my = (self.height - mh) / 2;
            rx -= mh;
            [self.rightImageView setFrame:CGRectMake(rx, my, mh, mh)];
            rx -= mh * 0.15;
        }
        if (self.item.subTitle) {
            size = [self.subTitleLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
            rx -= size.width;
            [self.subTitleLabel setFrame:CGRectMake(rx, y - 0.5, size.width, h)];
            rx -= 5;
        }
        if (self.item.middleImageName) {
            float mh = self.height * self.item.middleImageHeightOfCell;
            float my = (self.height - mh) / 2 - 0.5;
            rx -= mh;
            [self.middleImageView setFrame:CGRectMake(rx, my, mh, mh)];
            rx -= mh * 0.15;
        }
    }
    else if (self.item.alignment == MineModelItemAlignmentLeft) {
        float t = 105;
        float lx = (x < t ? t : x);
        if (self.item.subTitle) {
            size = [self.subTitleLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
            [self.subTitleLabel setFrame:CGRectMake(lx, y - 0.5, size.width, h)];
            lx += size.width + 5;
        }
        else if (self.item.subImages && self.item.subImages.count > 0) {
            float imageWidth = self.height * 0.65;
            float width = self.width * 0.89 - lx;
            float space = 0;
            NSUInteger count = width / imageWidth * 1.1;
            count = count < self.subImageArray.count ? count : self.subImageArray.count;
            for (int i = 0; i < count; i ++) {
                UIButton *iV = [self.subImageArray objectAtIndex:i];
                [iV setFrame:CGRectMake(lx + (imageWidth + space) * i, (self.height - imageWidth) / 2, imageWidth, imageWidth)];
                space = imageWidth * 0.1;
            }
            for (int i = (int)count; i < self.item.subImages.count; i ++) {
                UIButton *iV = [self.subImageArray objectAtIndex:i];
                [iV removeFromSuperview];
            }
        }
    }
    
}

#pragma mark - 重写item的Setter方法
- (void) setItem:(MineModelItem *)item{
    _item = item;
    
    // 设置数据
    if (item.type == MineModelItemTypeButton) {
        [self.cButton setTitle:item.title forState:UIControlStateNormal];
        [self.cButton setBackgroundColor:item.btnBGColor];
        [self.cButton setTitleColor:item.btnTitleColor forState:UIControlStateNormal];
        [self.cButton setHidden:NO];
        [self.titleLabel setHidden:YES];
        [self.cButton setTag:item.tag];
    }else {
        [self.cButton setHidden:YES];
        [self.titleLabel setText:item.title];
        [self.titleLabel setHidden:NO];
    }
    
    if (item.subTitle) {
        [self.subTitleLabel setText:item.subTitle];
        [self.subTitleLabel setHidden:NO];
    }else {
        [self.subTitleLabel setHidden:YES];
    }
    
    if (item.imageName) {
        [self.mainImageView setImage:[UIImage imageNamed:item.imageName]];
        [self.mainImageView setHidden:NO];
    }else {
        [self.middleImageView setImage:nil];
        [self.mainImageView setHidden:YES];
    }
    
    if (item.middleImageName) {
        [self.middleImageView setImage:[UIImage imageNamed:item.middleImageName]];
        [self.middleImageView setHidden:NO];
    }else {
        [self.middleImageView setImage:nil];
        [self.middleImageView setHidden:YES];
    }
    
    if (item.rightImageName) {
        [self.rightImageView setImage:[UIImage imageNamed:item.rightImageName]];
        [self.rightImageView setHidden:NO];
    }else {
        [self.rightImageView setImage:nil];
        [self.rightImageView setHidden:YES];
    }
    
    if (item.type == MineModelItemTypeSwitch) {
        [self.cSwitch setHidden:NO];
        [self.cSwitch setTag:item.tag];
        if(item.isOn){
            self.cSwitch.on = YES;
        }else{
            self.cSwitch.on = NO;
        }
    }else {
        [self.cSwitch setHidden:YES];
    }
    
    if (item.subImages) {
        for (int i = 0; i < item.subImages.count; i++) {
            id imageName = item.subImages[i];
            UIButton *button = nil;
            if (i < self.subImageArray.count) {
                button = self.subImageArray[i];
            }else {
                button = [[UIButton alloc] init];
                [self.subImageArray addObject:button];
            }
            
            if ([imageName isKindOfClass:[NSString class]]) {
                [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
            }
            [self addSubview:button];
        }
        
        for (int i = (int)(item.subImages.count); i < self.subImageArray.count; i ++) {
            UIButton *button = self.subImageArray[i];
            [button removeFromSuperview];
        }
    }
    // 设置样式
    [self setBackgroundColor:item.bgColor];
    [self setAccessoryType:item.accessoryType];
    [self setSelectionStyle:item.selectionStyle];
    
    [self.titleLabel setFont:item.titleFont];
    [self.titleLabel setTextColor:item.titleColor];
    
    [self.subTitleLabel setFont:item.subTitleFont];
    [self.subTitleLabel setTextColor:item.subTitleColor];
    
    [self layoutSubviews];
}

#pragma mark - 根据text的值计算获得高度
+ (CGFloat) getHeightForText:(MineModelItem *)item{
    
    float defaultH = 43.0f, buttonH = 50.0f, subH = 86.0f;
    
    if (item.type == MineModelItemTypeButton) {
        return buttonH;
    }else if (item.subImages && item.subImages.count > 0) {
        return subH;
    }else{
        return defaultH;
    }
}

#pragma mark - Getter
- (UILabel *) titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        //[_titleLabel setFont:[UIFont systemFontOfSize:17.0f]];
    }
    return _titleLabel;
}

- (UILabel *) subTitleLabel{
    if (_subTitleLabel == nil) {
        _subTitleLabel = [[UILabel alloc] init];
        //[_subTitleLabel setFont:[UIFont systemFontOfSize:15.0f]];
    }
    return _subTitleLabel;
}

- (UIImageView *) mainImageView{
    if (_mainImageView == nil) {
        _mainImageView = [[UIImageView alloc] init];
    }
    return _mainImageView;
}

- (UIImageView *) middleImageView{
    if (_middleImageView == nil) {
        _middleImageView = [[UIImageView alloc] init];
    }
    return _middleImageView;
}

- (UIImageView *) rightImageView{
    if (_rightImageView == nil) {
        _rightImageView = [[UIImageView alloc] init];
    }
    return _rightImageView;
}

- (NSMutableArray *) subImageArray{
    if (_subImageArray == nil) {
        _subImageArray = [[NSMutableArray alloc] init];
    }
    return _subImageArray;
}

- (UISwitch *) cSwitch{
    if (_cSwitch == nil) {
        _cSwitch = [[UISwitch alloc] init];
        //[_cSwitch addTarget:self action:@selector(cSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _cSwitch;
}

- (UIButton *) cButton{
    if (_cButton == nil) {
        _cButton = [[UIButton alloc] init];
        [_cButton.layer setMasksToBounds:YES];
        [_cButton.layer setCornerRadius:4.0f];
        [_cButton.layer setBorderColor:DEFAULT_LINE_GRAY_COLOR.CGColor];
        [_cButton.layer setBorderWidth:0.5f];
        [_cButton.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
        
        // 注册按钮点击事件
        //[self.cButton addTarget:self action:@selector(cButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cButton;
}

#pragma mark - CommonMethod
- (UIView *) topLine{
    if (_topLine == nil) {
        _topLine = [[UIView alloc] init];
        _topLine.height = .5f;
        _topLine.backgroundColor = DEFAULT_LINE_GRAY_COLOR;
        //_topLine.alpha = .4f;
        [self.contentView addSubview:_topLine];
    }
    return _topLine;
}

- (UIView *) bottomLine{
    if (_bottomLine == nil) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.height = .5f;
        _bottomLine.backgroundColor = DEFAULT_LINE_GRAY_COLOR;
        //_bottomLine.alpha = .4f;
        [self.contentView addSubview:_bottomLine];
    }
    return _bottomLine;
}

- (void) setTopLineStyle:(CellLineStyle)style{
    _topLineStyle = style;
    if (style == CellLineStyleDefault) {
        [self.topLine setOriginX:_leftFreeSpace];
        self.topLine.width = self.width - _leftFreeSpace;
        [self.topLine setHidden:NO];
    }else if (style == CellLineStyleFill) {
        [self.topLine setOriginX:0];
        self.topLine.width = self.width;
        [self.topLine setHidden:NO];
    }else if (style == CellLineStyleNone) {
        [self.topLine setHidden:YES];
    }
}

- (void) setBottomLineStyle:(CellLineStyle)style{
    _bottomLineStyle = style;
    if (style == CellLineStyleDefault) {
        [self.bottomLine setOriginX:_leftFreeSpace];
        self.bottomLine.width = self.width - _leftFreeSpace;
        [self.bottomLine setHidden:NO];
    }else if (style == CellLineStyleFill) {
        [self.bottomLine setOriginX:0];
        self.bottomLine.width = self.width;
        [self.bottomLine setHidden:NO];
    }else if (style == CellLineStyleNone) {
        [self.bottomLine setHidden:YES];
    }
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
