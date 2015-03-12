//
//  DeviceHardwareHelper.m
//  LyricLife
//
//  Created by Jessie Serrino on 3/12/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "DeviceHardwareHelper.h"
@import MobileCoreServices;
@import UIKit;
@import AudioToolbox;


@interface DeviceHardwareHelper()
@property (nonatomic, strong) SimpleBlock enterBlock;
@property (nonatomic, strong) SimpleBlock leaveBlock;

@end

@implementation DeviceHardwareHelper

- (instancetype)init
{
    self = [super init];
    [[UIDevice currentDevice] setProximityMonitoringEnabled:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(proximityStateChanged) name:UIDeviceProximityStateDidChangeNotification object:nil];
    return self;
}

- (void) onProximityEventApproachDoThis: (SimpleBlock) action
{
    self.enterBlock = action;
}

- (void) onProximityEventLeavingDoThis: (SimpleBlock) action
{
    self.leaveBlock = action;
}

- (void) proximityStateChanged
{
    if([[UIDevice currentDevice] proximityState] == YES){
        if(self.enterBlock)
            self.enterBlock();
    }
    else{
        if(self.leaveBlock)
            self.leaveBlock();
    }
}

@end
