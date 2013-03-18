//
//  Sc2RanksServiceDelegate.h
//  SC2ranksCTCC
//
//  Created by markw on 3/16/13.
//  Copyright (c) 2013 markw. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Sc2RanksServiceDelegate <NSObject>

- (void)serviceRespondedWithPlayers:(NSArray *)players;

@end
