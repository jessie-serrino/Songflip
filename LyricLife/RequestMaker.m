//
//  RequestMaker.m
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "RequestMaker.h"

@implementation RequestMaker

+ (NSString *) requestURLFromRequestKey: (NSString *) key
{
    NSString *rawURL = @"http://api.musixmatch.com/ws/1.1/";
    NSString *apiKeyTag = @"apikey=";
    NSString *apiKey = @"dd97dc6ed180c30c1487c268f26d9df2";
    return [[[[rawURL stringByAppendingString:key] stringByAppendingString:@"?"] stringByAppendingString:apiKeyTag] stringByAppendingString:apiKey];
}

@end
