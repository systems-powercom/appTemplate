//
//  DataModel.m
//  appTemplate
//
//  Created by Groby Lington on 2015/01/04.
//  Copyright (c) 2015年 systems-power. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel
@synthesize name;
@synthesize number;


- (BOOL) checkNumbers:(NSNumber*)num1 withNumber:(NSNumber*)num2{
    BOOL result;
    
    if ([num1 intValue] == [num2 intValue]) {
        result = YES;
    }else{
        result = NO;
    }
    
    return result;
}

@end
