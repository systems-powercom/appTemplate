//
//  ViewController.m
//  appTemplate
//
//  Created by Groby Lington on 2014/12/28.
//  Copyright (c) 2014 systems-power. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

/**
Main view, which shows UI components.
 
 */

@implementation ViewController

@synthesize label;
@synthesize button;

/**
 The first method to call.
 
 */
- (void)viewDidLoad {
    LOG_METHOD;
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
}

/**
 The method when the view will appear
 @param animated set YES if animation is ON

 */
- (void)viewWillAppear:(BOOL)animated{
    LOG_METHOD;
    [super viewWillAppear:YES];
    [label setText:NSLocalizedString(@"labelText", nil)];
    [button setTitle:NSLocalizedString(@"buttonText", nil) forState:UIControlStateNormal];

}

/**
 The method when the view had appeared
 @param animated set YES if animation is ON
 */
- (void)viewDidAppear:(BOOL)animated{
    LOG_METHOD;
    [super viewDidAppear:YES];

}

/**
 The method when the memory warnings appear
 */
- (void)didReceiveMemoryWarning {
    LOG_METHOD;
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
