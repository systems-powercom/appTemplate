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
    
    //NSURL * url = [NSURL URLWithString:@"http://www.oreilly.com"];
    NSURL * url = [NSURL URLWithString:@"http://url.has.basic.auth"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
   
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:url] delegate:self];
    [connection start];
    
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

-(void)connection:(NSURLConnection*)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
    NSLog(@"willSendRequestForAuthenticationChallenge");
    
    if (challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodHTTPBasic) {
        if (challenge.previousFailureCount == 0) {
            NSURLCredential *creds = [[NSURLCredential alloc] initWithUser:@"username" password:@"password" persistence:NSURLCredentialPersistenceForSession];
            [challenge.sender useCredential:creds forAuthenticationChallenge:challenge];
        }
    }else{
        [[challenge sender] cancelAuthenticationChallenge:challenge];
        NSLog(@"invalid username or password");
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"invalid credentials");
            
        });
    }
}


@end
