//
//  ViewController.h
//  SecureForm
//
//  Created by Groby Lington on 2015/02/01.
//  Copyright (c) 2015年 systems-power. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SSKeychain/SSKeychain.h>

@interface ViewController : UIViewController

- (IBAction)getUsername;
- (IBAction)getPassword;
- (IBAction)saveUsername;
- (IBAction)savePassword;
- (IBAction)clearPassword;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (strong, nonatomic) NSString * username;
@property (strong, nonatomic) NSString * password;

@end

