//
//  WEDebugger.m
//  WEDebugger
//
//  Created by Lucas Ortis on 17/03/2016.
//  Copyright © 2016 Lucas Ortis. All rights reserved.
//

#import "WEDebugger.h"

@interface WEDebugger ()

@property(nonatomic, strong, readonly) NSDateFormatter *dateFormatter;

@end

@implementation WEDebugger

+ (instancetype)sharedInstance {
    static WEDebugger *sharedInstance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        sharedInstance = [self new];
    });
    
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _logs = [NSMutableArray array];
        _enabled = YES;
        _dateFormatter = [NSDateFormatter new];
        _dateFormatter.dateFormat = @"HH:mm:ss";
    }
    
    return self;
}

- (void)log:(const char *)file :(const char *)function :(NSInteger)line :(id)object, ... {
    if (!_enabled) {
        return;
    }
    
    const char * stringToDisplay;
    
    if ([object isKindOfClass:[NSString class]]) {
        va_list args;
        va_start(args, object);
        stringToDisplay = [[[NSString alloc] initWithFormat:object arguments:args] UTF8String];
        va_end(args);
    } else {
        stringToDisplay = [[object description] UTF8String];
    }
    
    [_logs addObject:[NSString stringWithUTF8String:stringToDisplay]];
    
    fprintf(stderr, "%s: %s => (%s:%ld) : %s\n", [[_dateFormatter stringFromDate:[NSDate date]] UTF8String], function, [[[NSString stringWithUTF8String:file] lastPathComponent] UTF8String], (long)line, stringToDisplay);
}

@end
