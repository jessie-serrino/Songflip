//
//  TrackParser.m
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "TrackParser.h"

@implementation TrackParser

+ (NSArray *) tracksWithTracksData: (NSData *) tracksData
{
    NSError *error;
    NSDictionary *tracksJson = [NSJSONSerialization JSONObjectWithData:tracksData options:kNilOptions error:&error];
    NSArray * trackList = tracksJson[@"message"][@"body"][@"track_list"];
    
    
    NSLog(@"%@", trackList[0]);
    if(error)
    {
        
    }
    
    NSMutableArray *tracksArray = [[NSMutableArray alloc] initWithCapacity:trackList.count];
    for(NSDictionary *trackDictionary in trackList)
    {
        [tracksArray addObject:[TrackParser trackWithTrackData:trackDictionary]];
    }
    
    return tracksArray;
}

+ (Track *) trackWithTrackData: (NSDictionary *) trackData
{
    NSDictionary *trackInformation = trackData[@"track"];
    NSString *artistName = trackInformation[@"artist_name"];
    NSString *songTitle = trackInformation[@"track_name"];
    NSInteger trackID = [trackInformation[@"track_id"] integerValue];
    Track *track = [[Track alloc] initWithArtist:artistName title:songTitle trackID:trackID];
    
    return track;
}

@end
