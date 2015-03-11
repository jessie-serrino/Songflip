//
//  SearchLyricsViewController.m
//  LyricLife
//
//  Created by Jessie Serrino on 3/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "SearchLyricsViewController.h"
#import "LyricsViewController.h"
#import "LyricsSearchRequest.h"
#import "TrackSearchRequest.h"
#import "LyricsParser.h"
#import "Lyrics.h"
#import "TrackParser.h"
#import "Track.h"

static NSString * const kDetailSegueIdentifier = @"detailViewSegue";

@interface SearchLyricsViewController () <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSArray *tracks;
@property (strong, nonatomic) Track *selectedTrack;
@property (strong, nonatomic) IBOutlet UITableView *trackListTableView;

@end

@implementation SearchLyricsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeTableView];

    
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
        [self.trackListTableView reloadData];
    }];
}

- (void) initializeTableView
{
    [self.trackListTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    self.trackListTableView.delegate = self;
    self.trackListTableView.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tracks.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];

    NSString *BasicCellIdentifier=NSStringFromClass([UITableViewCell class]);
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:BasicCellIdentifier];
    }

    NSInteger index = [indexPath item];
    Track *track = self.tracks[index];
    cell.textLabel.text = track.songTitle;
    cell.detailTextLabel.text = track.artist;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = [indexPath item];
    self.selectedTrack = self.tracks[index];
    
    [self performSegueWithIdentifier:kDetailSegueIdentifier sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    LyricsViewController *lyricsView =  [segue destinationViewController];
    lyricsView.trackInformation = self.selectedTrack;
    NSInteger trackID = self.selectedTrack.trackID;
    
    [LyricsSearchRequest lyricsSearchRequest:trackID withCompletionBlock:^(NSData *returnData){
        lyricsView.trackInformation.lyrics = [LyricsParser lyricsWithLyricsData: returnData];
        [lyricsView prepareLyrics];
    }];
}

@end
