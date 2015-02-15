//
//  ViewController.h
//  reminderTest
//
//  Created by Groby Lington on 2015/02/15.
//  Copyright (c) 2015年 systems-power. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>

@interface ViewController : UIViewController

@property(nonatomic, strong)EKEventStore * eventStore;

@end

