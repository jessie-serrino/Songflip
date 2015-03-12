//
//  LyricsParser.h
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Lyrics.h"

@interface LyricsParser : NSObject

+ (Lyrics *) lyricsWithLyricsData: (NSData *) lyricsData;


@end
