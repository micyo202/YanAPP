/************************************************************
 Class    : MineViewController.m
 Describe : 我的模块主控制器
 Company  : Micyo
 Author   : Yanzheng 严正
 Date     : 2018-04-17
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "MineViewController.h"
#import "MineTableViewCell.h"
#import "MineTableViewHeaderFooterView.h"
#import "MineManager.h"

@interface MineViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation MineViewController

static NSString * const reuseIdentifier = @"mineTableViewCell";
static NSString * const headerFooterViewReuseIdentifier = @"mineHeaderFooterView";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的";
    
    self.navigationController.navigationBar.barTintColor = DEFAULT_ORANGE_COLOR;
    
    [self.tableView registerClass:[MineTableViewCell class] forCellReuseIdentifier:reuseIdentifier];// 注册cell视图
    [self.tableView registerClass:[MineTableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:headerFooterViewReuseIdentifier];// 注册Header、Footer的cell
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.mj_header.hidden = YES;
    self.tableView.mj_footer.hidden = YES;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    _data = [[MineManager sharedMineManager] mineData];
    
    DLog(@"%lu", (unsigned long)_data.count);
    
}

#pragma mark - <UITableViewDataSource>数据源方法
#pragma mark 返回有多少组
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return self.data.count;
}

#pragma mark 返回每组条数
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    MineModelGroup *group = [_data objectAtIndex:section];
    return group.itemsCount;
}

#pragma mark 返回每行cell
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MineModelGroup *group = [_data objectAtIndex:indexPath.section];   // 获得组
    MineModelItem *item = [group itemAtIndex:indexPath.row];   // 获得组中的元素
    MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell setItem:item];
    
    // cell分割线
    if (item.type != MineModelItemTypeButton) {
        indexPath.row == 0 ? [cell setTopLineStyle:CellLineStyleFill] : [cell setTopLineStyle:CellLineStyleNone];
        indexPath.row == group.itemsCount - 1 ? [cell setBottomLineStyle:CellLineStyleFill] : [cell setBottomLineStyle:CellLineStyleDefault];
    }else {
        [cell setTopLineStyle:CellLineStyleNone];
        [cell setBottomLineStyle:CellLineStyleNone];
    }
    
    return cell;
}

#pragma mark - <UITableViewDelegate>代理方法
#pragma mark 设置tableView顶部视图
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    MineTableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterViewReuseIdentifier];
    if (_data && _data.count > section) {
        MineModelGroup *group = [_data objectAtIndex:section];
        [view setText:group.headerTitle];
    }
    return view;
}

#pragma mark 设置tableView底部视图
- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    MineTableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterViewReuseIdentifier];
    if (_data && _data.count > section) {
        MineModelGroup *group = [_data objectAtIndex:section];
        [view setText:group.footerTitle];
    }
    return view;
}

#pragma mark 设置cell的高度
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_data && _data.count > indexPath.section) {
        MineModelGroup *group = [_data objectAtIndex:indexPath.section];
        MineModelItem *item = [group itemAtIndex:indexPath.row];
        return [MineTableViewCell getHeightForText:item];
    }
    return 0.0f;
}

#pragma mark 设置Header顶部视图的高度
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (_data && _data.count > section) {
        MineModelGroup *group = [_data objectAtIndex:section];
        if (group.headerTitle == nil) {
            return section == 0 ? 20.0f : 10.0f;
        }
        return [MineTableViewHeaderFooterView getHeightForText:group.headerTitle];
    }
    return 10.0f;
}

#pragma mark 设置Footer底部视图的高度
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (_data && _data.count > section) {
        MineModelGroup *group = [_data objectAtIndex:section];
        if (group.footerTitle == nil) {
            return section == _data.count - 1 ? 30.0f : 10.0f;
        }
        return [MineTableViewHeaderFooterView getHeightForText:group.footerTitle];
    }
    return 10.0f;
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
