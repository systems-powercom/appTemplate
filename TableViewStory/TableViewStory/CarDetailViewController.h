//
//  CarDetailViewController.h
//  TableViewStory
//
//  Created by Groby Lington on 2015/01/12.
//  Copyright (c) 2015年 systems-power. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarDetailViewController : UIViewController
@property (strong, nonatomic) NSArray * carModelDetail;

@property (weak, nonatomic) IBOutlet UILabel *carMake;
@property (weak, nonatomic) IBOutlet UILabel *carModel;

@end
