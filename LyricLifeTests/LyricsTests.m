//
//  LyricsEntityTests.m
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Lyrics.h"

@interface LyricsTests : XCTestCase

@property (nonatomic, strong) Lyrics *moc;

@end

@implementation LyricsTests

- (void)setUp {
    [super setUp];

    self.moc = [[Lyrics alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitWithStringNotNil
{
    Lyrics *lyrics = [[Lyrics alloc] initWithString:@""];
    XCTAssertNotNil(lyrics, @"Init with string must not return nil");
}

- (void) testInitWithStringInitializesLines
{
    Lyrics *lyrics = [[Lyrics alloc] initWithString:@""];
    XCTAssertNotNil(lyrics.lines, @"Lines array must be initialized when passing a string");
}

- (void) testInitWithStringSavesLines
{
    Lyrics *lyrics =[[Lyrics alloc] initWithString:@"Party"];
    XCTAssertEqualObjects(@"Party", lyrics.lines[0]);
}

- (void) testInitWithStringSeparatesLines
{
    NSString *longString = [NSString stringWithFormat:@"Line 1\n"
                                                     @"Line 2\n"];
    Lyrics *lyrics =[[Lyrics alloc] initWithString:longString];
    XCTAssertEqualObjects(@"Line 1", lyrics.lines[0]);
    XCTAssertEqualObjects(@"Line 2", lyrics.lines[1]);
}

@end
