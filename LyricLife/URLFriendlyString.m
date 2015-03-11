//
//  URLFriendlyString.m
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "URLFriendlyString.h"

@implementation URLFriendlyString
+ (NSString *) urlFriendlyString: (NSString *) originalString
{
    return [originalString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
}

@end
