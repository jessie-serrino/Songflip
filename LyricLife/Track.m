//
//  TrackEntity.m
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "Track.h"

@implementation Track


- (instancetype) initWithArtist: (NSString *) artist title: (NSString *) songTitle trackID: (NSInteger) trackID
{
    self = [super init];
    _songTitle = songTitle;
    _artist = artist;
    _trackID = trackID;
    return self;
}

- (instancetype) initWithLyrics: (Lyrics *) lyrics artist: (NSString *) artist title: (NSString *) songTitle
{
    self = [super init];
    _lyrics = lyrics;
    _artist = artist;
    _songTitle = songTitle;
    return self;
}

@end
