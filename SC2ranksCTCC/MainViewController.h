//
//  MainViewController.h
//  SC2ranksCTCC
//
//  Created by markw on 3/16/13.
//  Copyright (c) 2013 markw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sc2RanksService.h"
#import "Sc2RanksServiceDelegate.h"

@interface MainViewController : UIViewController <UITableViewDataSource, UITabBarDelegate, UISearchBarDelegate,
Sc2RanksServiceDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (id)initWithSc2Service:(Sc2RanksService *)service;

@end
