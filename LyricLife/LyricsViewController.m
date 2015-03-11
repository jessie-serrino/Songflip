//
//  LyricsViewController.m
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "LyricsViewController.h"
#import "LyricsStepper.h"


static NSString * const kLyricPath = @"currentLyric";

@interface LyricsViewController()
@property (nonatomic, strong) LyricsStepper *stepper;
@property (nonatomic, strong) NSString  *currentLyric;

@end

@implementation LyricsViewController

- (void) prepareLyrics
{
    if(self.trackInformation.lyrics)
    {
        _stepper = [[LyricsStepper alloc] initWithLyrics:self.trackInformation.lyrics];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [self addObserver:self forKeyPath:kLyricPath options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString: kLyricPath])
    {
        NSLog(@"Observed changes, update UI");
    }
}

- (void) viewWillDisappear:(BOOL)animated
{
    [self removeObserver:self forKeyPath:kLyricPath];
}

- (void)viewDidAppear:(BOOL)animated
{

}

@end
