//
//  CarDetailViewController.m
//  TableViewStory
//
//  Created by Groby Lington on 2015/01/12.
//  Copyright (c) 2015年 systems-power. All rights reserved.
//

#import "CarDetailViewController.h"

@interface CarDetailViewController ()

@end

@implementation CarDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _carMake.text = _carModelDetail[0];
    _carModel.text = _carModelDetail[1];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
