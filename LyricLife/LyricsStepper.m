//
//  LyricsStepper.m
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "LyricsStepper.h"

@interface LyricsStepper()

@property (nonatomic) NSInteger lyricIndex;

@end

@implementation LyricsStepper

- (instancetype)initWithLyrics: (Lyrics *) lyrics;
{
    self = [super init];
    _lyrics = lyrics;
    _lyricIndex = 0;
    _lyricsAreOver = NO;
    return self;
}

- (BOOL) lyricsAreOver
{
    self.lyricsAreOver = !(_lyricIndex < self.lyrics.lines.count);
    return _lyricsAreOver;
}

- (NSString *)nextLyric
{
    if(self.lyricsAreOver)
        return @"";
    NSString *lyric = self.lyrics.lines[self.lyricIndex];
    _lyricIndex++;
    return lyric;
}

@end
