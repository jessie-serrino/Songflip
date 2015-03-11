//
//  LyricsViewController.h
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Lyrics.h"
#import "Track.h"

@interface LyricsViewController : UIViewController

@property (nonatomic, strong) Track *trackInformation;

- (void) prepareLyrics;

@end
