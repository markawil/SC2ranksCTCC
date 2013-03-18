//
//  SC2Player.h
//  SC2ranksCTCC
//
//  Created by markw on 3/16/13.
//  Copyright (c) 2013 markw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SC2Player : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *bnet_id;

- (id)initWithName:(NSString *)aName andBnetId:(NSString *)bnetId;

@end
