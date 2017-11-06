//
//  PullAnimationViewController.m
//  Demo集合
//
//  Created by super on 2017/9/26.
//  Copyright © 2017年 super. All rights reserved.
//

#import "PullAnimationViewController.h"

#import "MyHeaderView.h"

#define kScreen_height  [[UIScreen mainScreen] bounds].size.height
#define kScreen_width   [[UIScreen mainScreen] bounds].size.width

@interface PullAnimationViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) MyHeaderView *headerView; // 上面蓝色的 view，可以自定义
@property (assign, nonatomic) CGFloat headerViewHeight;     // headerView 高度

@end

@implementation PullAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _headerViewHeight = 180;
    
    // 占位用的 view，高度 180
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_width, _headerViewHeight)];
    view.backgroundColor = [UIColor clearColor];
    _tableView.tableHeaderView = view;
    _tableView.sectionHeaderHeight = 20;
    
    [self.view addSubview:self.headerView];
}

// 自定义的 headerView
- (MyHeaderView *)headerView {
    if (_headerView == nil) {
        _headerView = [[MyHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreen_width, _headerViewHeight)];
    }
    return _headerView;
}

// 监听 tableView.contentOffset，也可以用 kvo 监听
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    
    CGRect frame = self.headerView.frame;
    if (offsetY < 0) {
        frame.size.height = _headerViewHeight - offsetY;
        frame.origin.y = 0;             // 及时归零
    } else {
        frame.size.height = _headerViewHeight;
        frame.origin.y = -offsetY;
    }
    self.headerView.frame = frame;
}

// --------------------------- 以下代码不是实验重点 ---------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"mycell"];
        cell.textLabel.text = @"hello world";
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"UITableViewHeaderFooterViewID"];
    if (view == nil) {
        view = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"UITableViewHeaderFooterViewID"];
        view.contentView.backgroundColor = [UIColor colorWithWhite:0.92 alpha:1.0];;
    }
    return view;
}

@end
