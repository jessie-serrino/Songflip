//
//  TrackSearchRequest.m
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "TrackSearchRequest.h"
#import "RequestMaker.h"
#import "URLFriendlyString.h"

static NSString * const kTrackQuery =@"track.search";
static NSString * const kRequestAdd = @"&q=";
static NSString * const kWithLyricsFilter = @"&f_has_lyrics=1";


@implementation TrackSearchRequest

+ (void) trackSearchRequest: (NSString *) req withCompletionBlock: (void (^)(NSData *resultData)) completionBlock
{
    
    NSString *baseURL = [RequestMaker requestURLFromRequestKey:kTrackQuery];
    NSString *fixedRequest = [URLFriendlyString urlFriendlyString:req];
    NSString *fullURL = [[[baseURL stringByAppendingString:kRequestAdd] stringByAppendingString:fixedRequest] stringByAppendingString:kWithLyricsFilter];
    //NSLog(@"Track Search Request: %@", fullURL);
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:fullURL]
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                (void) error;
                (void) response;
                completionBlock(data);
            }] resume];
    
}


@end
