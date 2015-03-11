//
//  LyricsViewController.m
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "LyricsViewController.h"
#import "LyricsStepper.h"
@import AudioToolbox;


static NSString * const kLyricPath = @"currentLyric";

@interface LyricsViewController()
@property (nonatomic, strong) LyricsStepper *stepper;
@property (nonatomic, strong) NSString  *currentLyric;
@property (strong, nonatomic) IBOutlet UILabel *lyricLabel;

@end

@implementation LyricsViewController

- (void) prepareLyrics
{
    if(self.trackInformation.lyrics)
    {
        _stepper = [[LyricsStepper alloc] initWithLyrics:self.trackInformation.lyrics];
        self.lyricLabel.text = [self.stepper nextLyric];
        
    }
}

- (void)viewWillAppear:(BOOL)animated
{
}



- (void) viewWillDisappear:(BOOL)animated
{
}

- (void)viewDidAppear:(BOOL)animated
{

}

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [self stepLyric];
}

- (void) stepLyric
{
    if (self.stepper)
    {
        self.lyricLabel.text = [self.stepper nextLyric];
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        
    }
}

@end
