//
//  Sc2RanksService.m
//  SC2ranksCTCC
//
//  Created by markw on 3/16/13.
//  Copyright (c) 2013 markw. All rights reserved.
//

#import "Sc2RanksService.h"
#import "AFNetworking.h"
#import "SC2Player.h"

@implementation Sc2RanksService

- (void)querySc2RanksWithPlayerName:(NSString *)player_name {
    
    NSString *urlPath = [NSString stringWithFormat:@"http://sc2ranks.com/api/search/exact/us/%@.json?appKey=google.com", player_name];
    
    NSURL *url = [NSURL URLWithString:urlPath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        NSArray *charactersArray = [JSON valueForKey:@"characters"];
        
        NSMutableArray *arrayToReturn = [NSMutableArray array];
        for (NSDictionary *d in charactersArray) {
            
            NSString *playerName = [d objectForKey:@"name"];
            NSString *bnetId = [d objectForKey:@"bnet_id"];
            
            SC2Player *newPlayer = [[SC2Player alloc] initWithName:playerName andBnetId:bnetId];
            [arrayToReturn addObject:newPlayer];
        }        
        
        [self.delegate serviceRespondedWithPlayers:arrayToReturn];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        
    }];
    
    [operation start];
}

@end
