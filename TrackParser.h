//
//  TrackParser.h
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Track.h"


@interface TrackParser : NSObject

+ (NSArray *) tracksWithTracksData: (NSData *) tracksData;



@end
