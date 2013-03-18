//
//  Sc2RanksService.h
//  SC2ranksCTCC
//
//  Created by markw on 3/16/13.
//  Copyright (c) 2013 markw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SC2Player.h"
#import "Sc2RanksServiceDelegate.h"

@interface Sc2RanksService : NSObject

- (void)querySc2RanksWithPlayerName:(NSString *)player_name;

@property (weak, nonatomic) id<Sc2RanksServiceDelegate> delegate;

@end
