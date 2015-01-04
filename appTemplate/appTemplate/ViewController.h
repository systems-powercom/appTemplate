//
//  ViewController.h
//  appTemplate
//
//  Created by Groby Lington on 2014/12/28.
//  Copyright (c) 2014 systems-power. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) DataModel * dataModel;

@end

