//
//  LSWebViewController.m
//  SlideMenuTest
//
//  Created by Lingostar on 2013. 11. 24..
//  Copyright (c) 2013년 CodersHigh. All rights reserved.
//

#import "LSWebViewController.h"

@interface LSWebViewController ()

@end

@implementation LSWebViewController

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
	// Do any additional setup after loading the view.
    
    UIWebView *myWebView;
    NSArray *subViews = self.view.subviews;
    for (UIView *subView in subViews) {
        if ([subView isKindOfClass:[UIWebView class]]){
            myWebView = (UIWebView *)subView;
            break;
        }
    }
    
    NSString *urlString;
    
    if (![self.loadURL hasPrefix:@"http://"])
    {
        urlString = [NSString stringWithFormat:@"http://%@", self.loadURL];
    } else {
        urlString = self.loadURL;
    }
    
    NSURL *paramURL = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:paramURL];
    [myWebView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
