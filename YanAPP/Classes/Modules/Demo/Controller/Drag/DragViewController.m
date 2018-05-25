/************************************************************
 Class    : DragViewController.m
 Describe : 长按放大拖拽移动视图控制器
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-05-25
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "DragViewController.h"
#import "BorderView.h"

@interface DragViewController ()
{
    CGPoint startPoint;
    NSInteger beginPos;
    NSInteger endPos;
}
@property (nonatomic, assign) CGPoint buttonPoint;
@property (nonatomic, strong) NSArray *textArray;
@property (nonatomic, strong) NSMutableArray *deshArray;
@property (nonatomic, strong) NSMutableArray *buttonArray;

@end

@implementation DragViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.scrollView];
    _textArray = @[@"Java", @"Scala", @"Objective-C", @"Shell", @"Python", @"Ruby", @"R"];
    [self initializeAppearance];
}

- (void)initializeAppearance {
    _deshArray = [NSMutableArray array];
    int itemWidth = ((self.view.bounds.size.width - 50) / 4);
    for (int i = 0; i < _textArray.count + 1; i++) {
        CGRect frame = CGRectMake((i % 4) * (itemWidth + 10) +10, 35 + (i / 4) * 40 + 5, itemWidth, 30);
        frame = CGRectInset(frame, 1, 1);
        BorderView *bv = [[BorderView alloc] initWithFrame:frame];
        [self.scrollView addSubview:bv];
        [_deshArray addObject:bv];
    }
    [self initMenuButton:_textArray];
}

- (void)initMenuButton:(NSArray *)array {
    _buttonArray = [NSMutableArray array];
    int buttonWidth = ((self.view.bounds.size.width - 50) / 4);
    for (int i = 0; i < array.count; i ++) {
        DLog(@"第%d个:   %d",i, i/4);
        UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        menuButton.tag = i;
        menuButton.frame = CGRectMake((i%4)*(buttonWidth+10)+10,35+(i/4)*40+5,buttonWidth,30);
        menuButton.backgroundColor = [UIColor whiteColor];
        [menuButton setTitle:array[i] forState:UIControlStateNormal];
        [menuButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        menuButton.titleLabel.font = [UIFont systemFontOfSize:14];
        menuButton.layer.borderColor = HexColor(@"#E5E5E5", 1).CGColor;;
        menuButton.layer.borderWidth = 0.3f;
        UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureRecognizerAction:)];
        [menuButton addGestureRecognizer:longGesture];
        [self.scrollView addSubview:menuButton];
        [self.buttonArray addObject:menuButton];
    }
    NSLog(@"_buttonArray = %@",_buttonArray);
}

- (void)longPressGestureRecognizerAction:(UILongPressGestureRecognizer *)sender {
    UIButton *btn = (UIButton *)sender.view;
    [self.scrollView bringSubviewToFront:btn];// 把当前选中视图挪到最前方
    if (sender.state == UIGestureRecognizerStateBegan) {
        startPoint = [sender locationInView:sender.view];
        beginPos = btn.tag;
        _buttonPoint = btn.center;
        NSLog(@"btn = %@",btn);
        NSLog(@"btn.tag = %lu",btn.tag);
        [UIView animateWithDuration:0.2 animations:^{
            btn.transform = CGAffineTransformMakeScale(1.1, 1.1);
            //btn.alpha = 0.7;
        }];
    } else if (sender.state == UIGestureRecognizerStateChanged){
        CGPoint newPoint = [sender locationInView:sender.view];
        CGFloat deltaX = newPoint.x - startPoint.x;
        CGFloat deltaY = newPoint.y - startPoint.y;
        btn.center = CGPointMake(btn.center.x + deltaX, btn.center.y + deltaY);
        NSInteger fromIndex = btn.tag;
        
        NSInteger toIndex = [self judgeMoveByButtonPoint:btn.center moveButton:btn];
        
        if (toIndex < 0) {
            return;
        } else {
            btn.tag = toIndex;
            // 向后移动
            if (fromIndex - toIndex < 0) {
                for (NSInteger i = fromIndex; i < toIndex; i ++) {
                    UIButton *nextBtn = _buttonArray[i+1];
                    // 改变按钮中心点的位置
                    CGPoint temp = nextBtn.center;
                    WeakSelf(self)
                    [UIView animateWithDuration:0.5 animations:^{
                        nextBtn.center = weakself.buttonPoint;
                    }];
                    _buttonPoint = temp;
                    // 交换tag值
                    nextBtn.tag = i;
                    
                }
                [self sortArray];
            } else if (fromIndex - toIndex > 0) {
                // 向前移动
                for (NSInteger i = fromIndex; i > toIndex; i --) {
                    UIButton *beforBtn = _buttonArray[i - 1];
                    CGPoint temp = beforBtn.center;
                    WeakSelf(self)
                    [UIView animateWithDuration:0.5 animations:^{
                        beforBtn.center = weakself.buttonPoint;
                    }];
                    _buttonPoint = temp;
                    beforBtn.tag = i;
                }
                [self sortArray];
            }
            
            
        }
        
    } else {
        WeakSelf(self)
        [UIView animateWithDuration:0.2 animations:^{
            btn.transform = CGAffineTransformIdentity;
            btn.alpha = 1.0f;
            btn.center = weakself.buttonPoint;
        }];
    }
}

- (void)sortArray {
    // 对已改变按钮的数组进行排序
    [_buttonArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        UIButton *temp1 = (UIButton *)obj1;
        UIButton *temp2 = (UIButton *)obj2;
        return temp1.tag > temp2.tag;    //将tag值大的按钮向后移
    }];
}

- (NSInteger)judgeMoveByButtonPoint:(CGPoint)point moveButton:(UIButton *)btn {
    /**
     * 判断移动按钮的中心点是否包含了所在按钮的中心点如果是将i返回
     */
    for (NSInteger i = 0; i < _buttonArray.count; i++) {
        UIButton *button = _buttonArray[i];
        if (!btn || button != btn) {
            if (CGRectContainsPoint(button.frame, point)) {
                return i;
            }
        }
    }
    return -1;
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
