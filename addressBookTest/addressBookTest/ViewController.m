//
//  ViewController.m
//  addressBookTest
//
//  Created by Groby Lington on 2015/02/15.
//  Copyright (c) 2015年 systems-power. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize picker;

- (void)viewDidLoad {
    NSLog(@"viewDidLoad");
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    picker = [[ABPeoplePickerNavigationController alloc] init];
    picker.displayedProperties = @[@(kABPersonEmailProperty)];
    picker.peoplePickerDelegate = self;
    
    [self presentViewController:picker animated:YES completion:^{}];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    NSLog(@"didSelectPerson");

    if(property == kABPersonEmailProperty){
        ABMutableMultiValueRef multi = ABRecordCopyValue(person, property);
        CFStringRef email = ABMultiValueCopyValueAtIndex(multi, identifier);
        NSLog(@"email %@", (__bridge NSString *)email);
        // Do your tasks here
        CFRelease(email);
    }
    
}

-(BOOL)personViewController:(ABPersonViewController *)personViewController shouldPerformDefaultActionForPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    return YES;
}

@end
