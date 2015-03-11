//
//  LyricsSearchRequest.m
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "LyricsSearchRequest.h"
#import "RequestMaker.h"

static NSString * const kLyricsQuery = @"track.lyrics.get";
static NSString * const kTrackID = @"&track_id=";

@implementation LyricsSearchRequest

+ (void) lyricsSearchRequest: (NSInteger) lyricsID withCompletionBlock: (void (^)(NSData *resultData)) completionBlock
{
    NSString *idFromInteger = [NSString stringWithFormat:@"%i", lyricsID];
    NSString *baseURL = [RequestMaker requestURLFromRequestKey: kLyricsQuery];
    NSString *fullURL = [[baseURL stringByAppendingString:kTrackID] stringByAppendingString:idFromInteger];
    
    //NSLog(@"Lyrics Search URL: %@", fullURL);

    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:fullURL]
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                (void) error;
                (void) response;
                completionBlock(data);
            }] resume];
}

@end
