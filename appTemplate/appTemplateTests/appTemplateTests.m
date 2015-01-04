//
//  appTemplateTests.m
//  appTemplateTests
//
//  Created by Groby Lington on 2014/12/28.
//  Copyright (c) 2014年 systems-power. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DataModel.h"

@interface appTemplateTests : XCTestCase

@end

@implementation appTemplateTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
    
    int a = 10;
    int b = 10;
    int c = 5;
    
    XCTAssertEqual(a, b, "is a equal b?");
    XCTAssertNotEqual(a, c, "is not a equal c?");
    
    DataModel* dataModel = [DataModel new];
    
    
    XCTAssertTrue([dataModel checkNumbers:@10 withNumber:@10]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
