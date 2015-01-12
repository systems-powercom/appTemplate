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
@synthesize dataModel;

/**
 The first method to call.
 
 */
- (void)viewDidLoad {
    LOG_METHOD;
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    dataModel = [[DataModel alloc] init];
    [dataModel addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    dataModel.name = @"alice";
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqual:@"name"]) {
        NSLog(@"name changed : %@", ((DataModel*)object).name);
    }
}

/**
 The method when the view will appear
 @param animated set YES if animation is ON

 */
- (void)viewWillAppear:(BOOL)animated{
    LOG_METHOD;
    [super viewWillAppear:YES];
    //[label setText:NSLocalizedString(@"labelText", nil)];
    //[button setTitle:NSLocalizedString(@"buttonText", nil) forState:UIControlStateNormal];

}

/**
 The method when the view had appeared
 @param animated set YES if animation is ON
 */
- (void)viewDidAppear:(BOOL)animated{
    LOG_METHOD;
    [super viewDidAppear:YES];
    
    CGRect frame;
    CGSize size;
    
    frame = self.label.frame;
    size = [self.label.text sizeWithFont:self.label.font constrainedToSize:CGSizeMake(200, 100) lineBreakMode:NSLineBreakByWordWrapping];
    frame.size.height = size.height;
    self.label.frame = frame;
    
    [label setText:@"aaaaa"];
    
    if ([dataModel checkNumbers:@10 withNumber:@9]){
        LOG(@"same numbers");
    }else{
        LOG(@"not same numbers");
        
    }

}

/**
 The method when the memory warnings appear
 */
- (void)didReceiveMemoryWarning {
    LOG_METHOD;
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)back:(UIStoryboardSegue *)segue{
    LOG_METHOD;
    dataModel.name = @"back";

    NSLog(@"back");
}


@end
