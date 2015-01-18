//
//  ViewController.m
//  xmlparsetest
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
    
    NSString* xmlString = @"<?xml version=\"1.0\" encoding=\"UTF-8\"?><users><user name=\"hoge\" age=\"20\" /><user name=\"fuga\" age=\"30\" /></users>";
    NSData *xmlData = [xmlString dataUsingEncoding:NSUnicodeStringEncoding];
    NSXMLParser* parser = [[NSXMLParser alloc] initWithData:xmlData];
    [parser setDelegate:self];
    [parser parse];
    
    
    
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    // エレメント開始ハンドラ
    if (qName) {
        elementName = qName;
    }
    if ([elementName isEqualToString:@"user"]) {
        // 属性値を出力
        NSLog(@"Name is %@ , Age is %@", [attributeDict objectForKey:@"name"], [attributeDict objectForKey:@"age"]);
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    // エレメント終了ハンドラ
    if (qName) {
        elementName = qName;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
