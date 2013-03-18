//
//  SC2Player.m
//  SC2ranksCTCC
//
//  Created by markw on 3/16/13.
//  Copyright (c) 2013 markw. All rights reserved.
//

#import "SC2Player.h"

@implementation SC2Player

@synthesize name = _name;
@synthesize bnet_id = _bnet_id;

- (id)initWithName:(NSString *)aName andBnetId:(NSString *)bnetId {
    
    self = [super init];
    
    if (self) {
        _name = aName;
        _bnet_id = bnetId;
    }
    
    return self;
}

@end
