//
//  Sc2WebViewController.h
//  SC2ranksCTCC
//
//  Created by markw on 3/16/13.
//  Copyright (c) 2013 markw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Sc2WebViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (id)initWithURL:(NSURL *)url;

@end
