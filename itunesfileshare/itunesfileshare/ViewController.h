//
//  ViewController.h
//  itunesfileshare
//
//  Created by Groby Lington on 2015/02/01.
//  Copyright (c) 2015年 systems-power. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)loadFile:(id)sender;
- (IBAction)saveFile:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

