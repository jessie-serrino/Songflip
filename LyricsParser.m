//
//  LyricsParser.m
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "LyricsParser.h"

@implementation LyricsParser

+ (Lyrics *) lyricsWithLyricsData: (NSData *) lyricsData
{
    NSError *error;
    NSDictionary *lyricsJson = [NSJSONSerialization JSONObjectWithData:lyricsData options:kNilOptions error:&error];
    
    if(error)
    {
        
    }
    
    NSString *lyricsString = lyricsJson[@"message"][@"body"][@"lyrics"][@"lyrics_body"];
    Lyrics *lyrics =  [[Lyrics alloc] initWithString:lyricsString];
    return lyrics ;
}

@end
