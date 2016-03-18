//
//  WELog.m
//  WEDebugger
//
//  Created by Lucas Ortis on 18/03/2016.
//  Copyright © 2016 Lucas Ortis. All rights reserved.
//

#import "WELog.h"

@implementation WELog

- (instancetype)initWithLog:(NSString *)log type:(WELogType)type {
    self = [super init];
    
    if (self) {
        _log = log;
        _type = type;
    }
    
    return self;
}

@end
