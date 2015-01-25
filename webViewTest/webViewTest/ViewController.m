//
//  ViewController.m
//  webViewTest
//
//  Created by Groby Lington on 2015/01/25.
//  Copyright (c) 2015年 systems-power. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL * url = [NSURL URLWithString:@"http://www.oreilly.com"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    _webView.delegate = self;
    [_webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"webview did finish load");
    NSString * title = [_webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    NSLog(@"title = %@", title);
}

@end
