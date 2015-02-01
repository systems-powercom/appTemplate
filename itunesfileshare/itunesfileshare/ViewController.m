//
//  ViewController.m
//  itunesfileshare
//
//  Created by Groby Lington on 2015/02/01.
//  Copyright (c) 2015年 systems-power. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadFile:(id)sender {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *dir = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [NSString stringWithFormat:@"%@/test2.txt", dir];
    if ([fileManager fileExistsAtPath:filePath]) {
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        NSString *text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        _textView.text = text;
    }
}

- (IBAction)saveFile:(id)sender {
    NSString *dir = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    NSString *content = @"App wrote this text.";
    NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSString *filePath = [NSString stringWithFormat:@"%@/test.txt", dir];
    [data writeToFile:filePath atomically:YES];
}
@end
