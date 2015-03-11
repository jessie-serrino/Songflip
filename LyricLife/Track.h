//
//  TrackEntity.h
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Lyrics.h"

@interface Track : NSObject

@property (nonatomic, strong) Lyrics *lyrics;
@property (nonatomic, strong) NSString     *artist;
@property (nonatomic, strong) NSString     *songTitle;
@property (nonatomic)         NSInteger    trackID;

- (instancetype) initWithArtist: (NSString *) artist title: (NSString *) songTitle trackID: (NSInteger) trackID;
- (instancetype) initWithLyrics: (Lyrics *) lyrics artist: (NSString *) artist title: songTitle;

@end
