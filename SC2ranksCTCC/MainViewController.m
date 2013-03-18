//
//  MainViewController.m
//  SC2ranksCTCC
//
//  Created by markw on 3/16/13.
//  Copyright (c) 2013 markw. All rights reserved.
//

#import "MainViewController.h"
#import "SC2Player.h"   
#import "Sc2WebViewController.h"

@interface MainViewController () {
    
    Sc2RanksService *_service;
    NSArray *_players;
}

@end

@implementation MainViewController

- (id)initWithSc2Service:(Sc2RanksService *)service {
    
    self = [super init];
    
    if (self) {
        self.title = @"Starcraft 2 Ranks";
        _service = service;
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [self setSearchBar:nil];
    [super viewDidUnload];
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_players count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    SC2Player *player = [_players objectAtIndex:indexPath.row];
    cell.textLabel.text = player.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", player.bnet_id];
    UIImage *avatar = [UIImage imageNamed:@"sc2ranks.png"];
    [cell.imageView setImage:avatar];
    return cell;
}

#pragma mark - UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
    SC2Player *player = [_players objectAtIndex:indexPath.row];

    NSString *urlStr = [NSString stringWithFormat:@"http://sc2ranks.com/us/%@/%@", player.bnet_id, player.name];
    NSURL *url = [NSURL URLWithString:urlStr];
    Sc2WebViewController *webVC = [[Sc2WebViewController alloc] initWithURL:url];
    [self.navigationController pushViewController:webVC animated:YES];
}

#pragma mark - UISearchBarDelegate methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    NSString *text = searchBar.text;
    [_searchBar resignFirstResponder];    
    [_service querySc2RanksWithPlayerName:text];
}

#pragma mark - Sc2RanksServiceDelegate methods

- (void)serviceRespondedWithPlayers:(NSArray *)players {
    
    _players = [NSArray arrayWithArray:players];
    [self.tableView reloadData];
}

@end
