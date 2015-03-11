//
//  LyricsEntity.h
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lyrics : NSObject

@property (nonatomic, strong)   NSArray   *lines;
@property (nonatomic)           NSInteger lyricsID;

- (void) printAllLyrics;
- (instancetype) initWithString: (NSString *) lyrics;

@end
