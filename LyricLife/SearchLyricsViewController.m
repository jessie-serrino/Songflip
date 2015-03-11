//
//  SearchLyricsViewController.m
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "SearchLyricsViewController.h"
#import "LyricsSearchRequest.h"
#import "TrackSearchRequest.h"
#import "LyricsParser.h"
#import "Lyrics.h"
#import "TrackParser.h"
#import "Track.h"


@interface SearchLyricsViewController () <UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSArray *tracks;
@property (strong, nonatomic) Lyrics *lyrics;

@end

@implementation SearchLyricsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    // Do any additional setup after loading the view.

    
    // Need to weakify
//    [LyricsSearchRequest lyricsSearchRequest:52116342 withCompletionBlock:^(NSData *returnData){
//        NSLog(@"Logging...");
//        self.lyrics = [LyricsParser lyricsWithLyricsData:returnData];
//        [self.lyrics printAllLyrics];
//    }];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    // Weakify soon
    [TrackSearchRequest trackSearchRequest:searchBar.text withCompletionBlock:^(NSData *returnData){
        self.tracks = [TrackParser tracksWithTracksData:returnData];
    }];
}


- (void) initialize

@end
