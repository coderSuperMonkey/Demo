//
//  ViewController.m
//  Demo集合
//
//  Created by super on 2017/9/8.
//  Copyright © 2017年 super. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *array;

@end

@implementation ViewController

- (NSArray *)array {
    if (_array == nil) {
        _array = @[@"波浪纹",@"系统朗读文字",@"密码输入框",@"下拉动画", @"SegmentedControl", @"Switch", @"输入框自动调整高度", @"头部缩放"];
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self performSegueWithIdentifier:@"Wave" sender:nil];
            break;
        case 1:
            [self performSegueWithIdentifier:@"Speech" sender:nil];
            break;
        case 2:
            [self performSegueWithIdentifier:@"Password" sender:nil];
            break;
        case 3:
            [self performSegueWithIdentifier:@"Pull" sender:nil];
            break;
        case 4:
            [self performSegueWithIdentifier:@"Segment" sender:nil];
            break;
        case 5:
            [self performSegueWithIdentifier:@"Switch" sender:nil];
            break;
        case 6:
            [self performSegueWithIdentifier:@"Input" sender:nil];
            break;
        case 7:
            [self performSegueWithIdentifier:@"HeaderScale" sender:nil];
            break;
            
        default:
            break;
    }
}

@end
