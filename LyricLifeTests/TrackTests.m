//
//  TrackEntityTests.m
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Track.h"

@interface TrackTests : XCTestCase


@end

@implementation TrackTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTrackEntityInitWithLyricsAndArtistNotNil
{
//    LyricsEntity *lyrics = [[LyricsEntity alloc] initWithString:@""];
    Track *track = [[Track alloc] initWithLyrics:nil artist:nil title: nil];
    XCTAssertNotNil(track, @"Track init with lyrics and artist must not be nil");
}

- (void) testInitLyricsNotNil
{
    Lyrics *lyrics = [[Lyrics alloc] initWithString:@""];
    Track *track = [[Track alloc] initWithLyrics:lyrics artist:nil title: nil];
    XCTAssertNotNil(track.lyrics, @"Track init with lyrics and artist must not be nil");
}


- (void) testInitArtistNotNil
{
    NSString *artist = @"Artist";
    Track *track = [[Track alloc] initWithLyrics:nil artist:artist title: nil];
    XCTAssertNotNil(track.artist, @"Track init with lyrics and artist must not be nil");
}

- (void) testInitGetsLyrics
{
    Lyrics *lyrics = [[Lyrics alloc] initWithString:@""];
    Track *track = [[Track alloc] initWithLyrics:lyrics artist:nil title: nil];
    XCTAssertEqualObjects(track.lyrics, lyrics, @"Lyrics must be saved the same way");
}

- (void)testInitArtistGetsArtist {
    NSString *artist = @"Artist";
    Track *track = [[Track alloc] initWithLyrics:nil artist:artist title: nil];
    XCTAssertEqualObjects(@"Artist", track.artist);
}

- (void)testInitArtistGetsTitle {
    NSString *title = @"Title";
    Track *track = [[Track alloc] initWithLyrics:nil artist:nil title: title];
    XCTAssertEqualObjects(@"Title", track.songTitle);
}

@end
