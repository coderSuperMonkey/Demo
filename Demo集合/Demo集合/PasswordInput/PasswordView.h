//
//  PasswordView.h
//  Demo集合
//
//  Created by super on 2017/9/13.
//  Copyright © 2017年 super. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PasswordView : UIView

@property (nonatomic, copy) void(^completeInputBlock)(NSString *inputString);

/**
 *  清除密码
 */
- (void)clearUpPassword;

@end
