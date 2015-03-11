//
//  LyricsStepper.h
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Lyrics.h"

@interface LyricsStepper : NSObject

@property (nonatomic) BOOL lyricsAreOver;
@property (nonatomic, strong) Lyrics *lyrics;

- (NSString *) nextLyric;
- (instancetype)initWithLyrics: (Lyrics *) lyrics;

@end
