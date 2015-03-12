//
//  DeviceHardwareHelper.h
//  LyricLife
//
//  Created by Jessie Serrino on 3/12/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SimpleBlock)();


@interface DeviceHardwareHelper : NSObject
- (void) onProximityEventApproachDoThis: (SimpleBlock) action;

- (void) onProximityEventLeavingDoThis: (SimpleBlock) action;
@end
