//
//  WaveView.h
//  Demo集合
//
//  Created by super on 2017/9/8.
//  Copyright © 2017年 super. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Color(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

typedef void(^WaveBlock)(CGFloat currentY);

@interface WaveView : UIView

/**
 *  浪弯曲度
 */
@property (nonatomic, assign) CGFloat waveCurvature;

/**
 *  浪速
 */
@property (nonatomic, assign) CGFloat waveSpeed;

/**
 *  浪高
 */
@property (nonatomic, assign) CGFloat waveHeight;

/**
 *  实浪颜色
 */
@property (nonatomic, strong) UIColor *realWaveColor;

/**
 *  遮罩浪颜色
 */
@property (nonatomic, strong) UIColor *maskWaveColor;

@property (nonatomic, copy) WaveBlock waveBlock;

- (void)startWaveAnimation;
- (void)stopWaveAnimation;

@end
