//
//  SystemSpeechViewController.m
//  Demo集合
//
//  Created by super on 2017/9/8.
//  Copyright © 2017年 super. All rights reserved.
//

#import "SystemSpeechViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface SystemSpeechViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;
@property (nonatomic, strong) AVSpeechSynthesisVoice *voice;

@end

@implementation SystemSpeechViewController

- (AVSpeechSynthesizer *)synthesizer {
    if (_synthesizer == nil) {
        _synthesizer = [[AVSpeechSynthesizer alloc] init];
    }
    return _synthesizer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)speechLabelText:(id)sender {
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:self.textLabel.text];
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh_CN"];
    [self.synthesizer speakUtterance:utterance];
}

- (IBAction)speechTextViewText:(id)sender {
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:self.textView.text];
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh_CN"];
    [self.synthesizer speakUtterance:utterance];
}

- (IBAction)stop:(id)sender {
    [self.synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryWord];
}

@end
