//
//  CarTableViewCell.h
//  TableViewStory
//
//  Created by Groby Lington on 2015/01/12.
//  Copyright (c) 2015年 systems-power. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *carImage;
@property (weak, nonatomic) IBOutlet UILabel *makeLabel;
@property (weak, nonatomic) IBOutlet UILabel *modelLabel;

@end
