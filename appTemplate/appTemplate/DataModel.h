//
//  DataModel.h
//  appTemplate
//
//  Created by Groby Lington on 2015/01/04.
//  Copyright (c) 2015年 systems-power. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property(nonatomic, strong) NSString * name;
@property(nonatomic, strong) NSNumber * number;


- (BOOL) checkNumbers:(NSNumber*)num1 withNumber:(NSNumber*)num2;

@end
