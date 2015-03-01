//
//  DetailViewController.h
//  pullTest
//
//  Created by Groby Lington on 2015/03/01.
//  Copyright (c) 2015年 systems-power. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

