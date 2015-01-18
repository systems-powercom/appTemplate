//
//  ViewController.m
//  sqlitetest
//
//  Created by Groby Lington on 2015/01/17.
//  Copyright (c) 2015年 systems-power. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [_label setText:@"SQLITE TEST"];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"database.sqlite"];
    
    NSLog(@"db path = %@", path);
    
    FMDatabase *database = [FMDatabase databaseWithPath:path];
    
    [database open];
    [database executeUpdate:@"CREATE TABLE IF NOT EXISTS user(name text primary key, age int)"];
    
    // Building the string ourself
    NSString *query = [NSString stringWithFormat:@"insert into user values ('%@', %d)",
                       @"brandontreb", 25];
    [database executeUpdate:query];
    
    
    FMResultSet *results = [database executeQuery:@"select * from user"];
    while([results next]) {
        NSString *name = [results stringForColumn:@"name"];
        NSInteger age  = [results intForColumn:@"age"];
        NSLog(@"User: %@ - %d",name, age);
    }
    
    /*
     FMResultSet has many methods to retrieve data in an appropriate format:
     
     intForColumn:
     longForColumn:
     longLongIntForColumn:
     boolForColumn:
     doubleForColumn:
     stringForColumn:
     dateForColumn:
     dataForColumn:
     dataNoCopyForColumn:
     UTF8StringForColumnName:
     objectForColumnName:
     */
    
    //NSString *sql = @"ALTER TABLE TABLE_NAME ADD COLUMN ADDRESS TEXT;";
    //[database executeUpdate:sql];
    
    [database close];
    
    // file write
    NSString* value = @"Hello";
    NSData* data = [value dataUsingEncoding:NSUTF8StringEncoding];

    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSString *docsPath = [paths objectAtIndex:0];
    NSString *filePath = [docsPath stringByAppendingPathComponent:@"msg.txt"];

    //NSString* bundlePath = [[NSBundle mainBundle] bundlePath];
    //NSString* filePath = [bundlePath stringByAppendingPathComponent:@"msg.txt"];
    NSLog(@"file path = %@", filePath);
    [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
    NSFileHandle* handle;
    @try {
        handle = [NSFileHandle fileHandleForWritingAtPath:filePath];
        [handle writeData:data];
    }
    @finally {
        [handle closeFile];
    }
    
    // file read
    @try{
        handle = [NSFileHandle fileHandleForReadingAtPath:filePath];
        NSData* dataRead = [handle readDataToEndOfFile];
        NSString* valueRead = [[NSString alloc] initWithData:dataRead encoding:NSUTF8StringEncoding];
        NSLog(@"read data = %@", valueRead);
    }@finally{
        [handle closeFile];
    }
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
