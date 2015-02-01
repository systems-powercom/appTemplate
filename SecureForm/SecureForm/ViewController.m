//
//  ViewController.m
//  SecureForm
//
//  Created by Groby Lington on 2015/02/01.
//  Copyright (c) 2015年 systems-power. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getUsername{
    NSLog(@"getUsername");
    //return @"username";
    _username = [[NSUserDefaults standardUserDefaults] stringForKey:@"account"];

    [_label setText:_username];
}

- (IBAction)getPassword{
    NSLog(@"getPassword");
    //return @"password";
    
    _username = [[NSUserDefaults standardUserDefaults] stringForKey:@"account"];
    
    _password = [SSKeychain passwordForService:@"SecureForm" account:_username];
    [_label setText:_password];
    
    
}

- (IBAction)saveUsername{
    NSLog(@"saveUsername");
    [_label setText:_usernameTextField.text];
    [[NSUserDefaults standardUserDefaults] setValue:_usernameTextField.text forKey:@"account"];
}

- (IBAction)savePassword{
    NSLog(@"savePassword");
    [_label setText:_passwordTextField.text];
    
    [[NSUserDefaults standardUserDefaults] setValue:_usernameTextField.text forKey:@"account"];
    [SSKeychain setPassword:_passwordTextField.text forService:@"SecureForm" account:_usernameTextField.text];

}

- (IBAction)clearPassword{
    NSLog(@"clearPassword");
    [_label setText:@"password cleared"];
    [SSKeychain setPassword:@"" forService:@"SecureForm" account:_username];
}

@end
