//
//  HeaderScaleTableViewController.m
//  Demo集合
//
//  Created by super on 2017/9/26.
//  Copyright © 2017年 super. All rights reserved.
//

#import "HeaderScaleTableViewController.h"

#import "UIScrollView+HeaderScaleImage.h"
static NSString * const ID = @"cell";

@interface HeaderScaleTableViewController ()

@end

@implementation HeaderScaleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置tableView头部缩放图片
    self.tableView.yz_headerScaleImage = [UIImage imageNamed:@"header"];
    
    // 设置tableView头部视图，必须设置头部视图背景颜色为clearColor,否则会被挡住
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
    headerView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = headerView;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor redColor];
    
    NSString *text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    cell.textLabel.text = text;
    
    return cell;
}

@end
