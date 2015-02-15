//
//  ViewController.m
//  reminderTest
//
//  Created by Groby Lington on 2015/02/15.
//  Copyright (c) 2015年 systems-power. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.eventStore = [[EKEventStore alloc] init];
    
    [self.eventStore requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError *error){
        //__weak id weakSelf = self;
        if (granted){
            dispatch_async(dispatch_get_main_queue(), ^{
                
                EKReminder *reminder = [EKReminder reminderWithEventStore:self.eventStore];
                reminder.title = @"Reminder Title 001";
                
                reminder.calendar = [_eventStore defaultCalendarForNewReminders];
                
                NSString* dateString = @"2015-02-15 14:59:00";
                
                NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
                [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
                //タイムゾーンの指定
                [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"JST"]];
                
                NSDate *date = [formatter dateFromString:dateString];
                
                EKAlarm *alarm = [EKAlarm alarmWithAbsoluteDate:date];
                [reminder addAlarm:alarm];
                
                reminder.dueDateComponents = [[NSCalendar currentCalendar]components:NSCalendarUnitMinute|NSCalendarUnitHour|NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear fromDate:date];
                
                NSError * error;
                BOOL success = [_eventStore saveReminder:reminder commit:YES error:&error];
                if (!success) {
                    NSLog(@"error");
                }else{
                    NSLog(@"OK");
                }
            }
                           
                           
                           );
        }
    }
     ];
}

     
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
