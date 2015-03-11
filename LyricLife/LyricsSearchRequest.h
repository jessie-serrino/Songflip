//
//  LyricsSearchRequest.h
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LyricsSearchRequest : NSObject

+ (void) lyricsSearchRequest: (NSInteger) req withCompletionBlock: (void (^)(NSData *resultData)) completionBlock;

@end
