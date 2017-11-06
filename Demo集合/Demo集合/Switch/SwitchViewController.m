//
//  SwitchViewController.m
//  Demo集合
//
//  Created by super on 2017/9/26.
//  Copyright © 2017年 super. All rights reserved.
//

#import "SwitchViewController.h"

#import "Switch.h"

#define Color(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface SwitchViewController ()<SwitchDelegate>

@end

@implementation SwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /** 初始化方法
     *  switchValueChange: 开关状态改变回调block
     */
    Switch *switchView = [[Switch alloc] initWithFrame:CGRectMake(100, 100, 50, 25) switchValueChanged:^(Switch *swith, BOOL on) {
        // do someing
        NSLog(@"on----%d", on);
    }];
    [self.view addSubview:switchView];
    // delegate
    switchView.delegate = self;
    
    // 设置所有颜色
    //    [switchView setUpAllColors:^NSDictionary *(UIColor *__autoreleasing *onTintColor, UIColor *__autoreleasing *onBackgroundColor, UIColor *__autoreleasing *offTintColor, UIColor *__autoreleasing *offBackgroundColor, UIColor *__autoreleasing *tintColor) {
    //        // 可以通过这种方法设置需要设置的颜色
    //        *onTintColor = [UIColor redColor];
    //        *onBackgroundColor = [UIColor blueColor];
    //        *offTintColor = [UIColor greenColor];
    //        *offBackgroundColor = [UIColor grayColor];
    //        *tintColor = [UIColor blackColor];
    //        return nil;
    //    }];
    [switchView setUpAllColors:^NSDictionary *(UIColor *__autoreleasing *onTintColor, UIColor *__autoreleasing *onBackgroundColor, UIColor *__autoreleasing *offTintColor, UIColor *__autoreleasing *offBackgroundColor, UIColor *__autoreleasing *tintColor) {
        // 也可以通过这种方法设置需要设置的颜色
        return @{OnTintColor : Color(234, 67, 53), OnBackgroundColor : Color(244, 161, 154), OffTintColor : Color(255, 255, 255), OffBackgroundColor : Color(214, 214, 214), TintColor : [UIColor colorWithRed:0.8252 green:0.8252 blue:0.8252 alpha:1.0]};
    }];
}

#pragma mark - WZBSwitchDelegate
- (void)switchValueChange:(Switch *)swith on:(BOOL)on {
    // do someing
}

@end
