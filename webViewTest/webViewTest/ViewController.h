//
//  ViewController.h
//  webViewTest
//
//  Created by Groby Lington on 2015/01/25.
//  Copyright (c) 2015年 systems-power. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate,NSURLConnectionDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSURLConnection * connection;


@end

