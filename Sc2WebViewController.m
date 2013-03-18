//
//  Sc2WebViewController.m
//  SC2ranksCTCC
//
//  Created by markw on 3/16/13.
//  Copyright (c) 2013 markw. All rights reserved.
//

#import "Sc2WebViewController.h"

@interface Sc2WebViewController () {
    
    NSURL *urlToPlayer;
}

@end

@implementation Sc2WebViewController

- (id)initWithURL:(NSURL *)url {
    
    self = [super init];
    
    if (self) {
        
        self.title = @"Sc2 Ranks";
        urlToPlayer = url;
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
    NSURLRequest *request = [NSURLRequest requestWithURL:urlToPlayer];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setWebView:nil];
    [super viewDidUnload];
}
@end
