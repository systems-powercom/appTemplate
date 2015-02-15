//
//  ViewController.h
//  addressBookTest
//
//  Created by Groby Lington on 2015/02/15.
//  Copyright (c) 2015年 systems-power. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate, ABPersonViewControllerDelegate>

@property(nonatomic, strong) ABPeoplePickerNavigationController * picker;


@end

