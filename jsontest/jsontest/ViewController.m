//
//  ViewController.m
//  jsontest
//
//  Created by Groby Lington on 2015/01/18.
//  Copyright (c) 2015年 systems-power. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //JSON-> NSDictionary
    NSString* str;
    str = @"[{\"title\":\"RDocを記述する\", \"content\":\"RDocを記述する\"}, {\"title\":\"組み込んで使えるようにする\", \"content\":\"組み込んで使えるようにする\"}]";


    // JSON 文字列をそのまま NSJSONSerialization に渡せないので、
    // NSData に変換する
    NSData *jsonData = [str dataUsingEncoding:NSUnicodeStringEncoding];
    
    // JSON を NSArray に変換する
    NSError *error;
    NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData
                                                     options:NSJSONReadingAllowFragments
                                                       error:&error];
    
    // JSON のオブジェクトは NSDictionary に変換されている
    for (NSDictionary *obj in array)
    {
        NSLog(@"title = %@", [obj objectForKey:@"title"]);
    }
    
    //NSDictionary -> JSON
    jsonData = [NSJSONSerialization dataWithJSONObject:array
                                               options:NSJSONWritingPrettyPrinted
                                                 error:&error];
    
    NSString* jsonDataString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"jsonData string: %@", jsonDataString);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
