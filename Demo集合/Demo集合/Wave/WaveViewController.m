//
//  WaveViewController.m
//  Demo集合
//
//  Created by super on 2017/9/8.
//  Copyright © 2017年 super. All rights reserved.
//

#import "WaveViewController.h"

#import "WaveView.h"

@interface WaveViewController ()

@end

@implementation WaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(375.0/2-30, 0, 60, 60)];
    imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    imageView.layer.borderWidth = 2;
    imageView.layer.cornerRadius = 20;
    
    WaveView *wave = [[WaveView alloc] initWithFrame:CGRectMake(0, 0, 375, 200)];
    [self.view addSubview:wave];
    wave.backgroundColor = Color(248, 64, 87, 1);
    [wave addSubview:imageView];
    wave.waveBlock = ^(CGFloat currentY) {
        CGRect iconFrame = [imageView frame];
        iconFrame.origin.y = 200-60+currentY-wave.waveHeight;
        imageView.frame  =iconFrame;
    };
    wave.waveHeight = 10;
    wave.waveSpeed = 1.0;
    [wave startWaveAnimation];
}

@end
