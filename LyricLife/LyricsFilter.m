//
//  LyricsFilter.m
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "LyricsFilter.h"

@implementation LyricsFilter
+ (NSArray *) filteredArrayFromString: (NSString *) originalString
{
    NSMutableArray *lyricsArray = [NSMutableArray arrayWithArray: [originalString componentsSeparatedByString:@"\n"]];
    NSMutableIndexSet *indexSet = [[NSMutableIndexSet alloc] init];
    for(NSUInteger i = 0; i < lyricsArray.count; i++)
    {
        NSString *s = lyricsArray[i];
        if([s isEqualToString:@""] || [s isEqualToString:@"..."] || [s containsString:@"******* This Lyrics is NOT"])
        {
            [indexSet addIndex: i];
        }
        if([[s stringByReplacingOccurrencesOfString:@" " withString:@""] isEqualToString:@""])
        {
            [indexSet addIndex:i];
        }
    }
    
    [lyricsArray removeObjectsAtIndexes:indexSet];
    
    return lyricsArray;
}
@end
