//
//  LyricsEntity.m
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "Lyrics.h"

@interface Lyrics()


@end

@implementation Lyrics

- (instancetype) initWithString: (NSString *) lyrics
{
    self = [super init];
    _lines = [lyrics componentsSeparatedByString:@"\n"];
    return self;
}

- (void) printAllLyrics
{
    for(NSString * lyric in self.lines)
    {
        NSLog(@"%@", lyric);
    }
}

@end
