//
//  InputPasswordViewController.m
//  Demo集合
//
//  Created by super on 2017/9/26.
//  Copyright © 2017年 super. All rights reserved.
//

#import "InputPasswordViewController.h"

#import "PasswordView.h"

@interface InputPasswordViewController ()

@property (nonatomic, strong) PasswordView *pasView;

@end

@implementation InputPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pasView = [[PasswordView alloc] initWithFrame:CGRectMake(16, 100, self.view.frame.size.width - 32, 45)];
    [self.view addSubview:_pasView];
    self.pasView.completeInputBlock = ^(NSString *inputString) {
        NSLog(@"输入完成:%@",inputString);
    };
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor brownColor];
    button.frame = CGRectMake(100, 180, self.view.frame.size.width - 200, 50);
    [button addTarget:self action:@selector(clearPaw) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"清空密码" forState:UIControlStateNormal];
    [self.view addSubview:button];
}

- (void)clearPaw
{
    [self.pasView clearUpPassword];
}

@end
