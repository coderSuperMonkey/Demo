//
//  InputViewController.m
//  Demo集合
//
//  Created by super on 2017/9/26.
//  Copyright © 2017年 super. All rights reserved.
//

#import "InputViewController.h"

#import "InputTextView.h"

@interface InputViewController ()

@property (weak, nonatomic) IBOutlet InputTextView *inputTextView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@end

@implementation InputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 监听键盘弹出
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    // 设置文本框占位文字
    _inputTextView.placeholder = @"请输入文字";
    _inputTextView.placeholderColor = [UIColor redColor];
    
    // 监听文本框文字高度改变
    _inputTextView.textHeightChangeBlock = ^(NSString *text,CGFloat textHeight){
        // 文本框文字高度改变会自动执行这个【block】，可以在这【修改底部View的高度】
        // 设置底部条的高度 = 文字高度 + textView距离上下间距约束
        // 为什么添加10 ？（10 = 底部View距离上（5）底部View距离下（5）间距总和）
        _bottomHeightConstraint.constant = textHeight + 10;
    };
    
    // 设置文本框最大行数
    _inputTextView.maxNumberOfLines = 4;

}

// 键盘弹出会调用
- (void)keyboardWillChangeFrame:(NSNotification *)note
{
    // 获取键盘frame
    CGRect endFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    // 获取键盘弹出时长
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    
    // 修改底部视图距离底部的间距
    _bottomConstraint.constant = endFrame.origin.y != screenH ? endFrame.size.height : 0;
    
    // 约束动画
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    }];
}

-  (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
