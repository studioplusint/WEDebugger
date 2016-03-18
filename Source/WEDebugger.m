//
//  WEDebugger.m
//  WEDebugger
//
//  Created by Lucas Ortis on 17/03/2016.
//  Copyright © 2016 Lucas Ortis. All rights reserved.
//

#import "WEDebugger.h"
#import "WELog.h"

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
    va_list args;
    va_start(args, object);
    
    [self log:file :function :line :object :WELogDefaultType, args];
    
    va_end(args);
}

- (void)log:(const char *)file :(const char *)function :(NSInteger)line :(id)object :(WELogType)type, ... {
    if (!_enabled) {
        return;
    }
    
    const char * stringToDisplay;
    
    if ([object isKindOfClass:[NSString class]]) {
        va_list args;
        va_start(args, type);
        stringToDisplay = [[[NSString alloc] initWithFormat:object arguments:args] UTF8String];
        va_end(args);
    } else {
        stringToDisplay = [[object description] UTF8String];
    }
    
    NSString *fullString = [NSString stringWithFormat:@"%s: %s => (%s:%ld) : %s\n", [[_dateFormatter stringFromDate:[NSDate date]] UTF8String], function, [[[NSString stringWithUTF8String:file] lastPathComponent] UTF8String], (long)line, stringToDisplay];
    
    [_logs addObject:[[WELog alloc] initWithLog:fullString type:type]];
    
    fprintf(stderr, [fullString UTF8String]);
}

- (void)successLog:(const char *)file :(const char *)function :(NSInteger)line :(id)object, ... {
    va_list args;
    va_start(args, object);
    
    [self log:file :function :line :object :WELogSuccessType, args];
    
    va_end(args);
}

- (void)errorLog:(const char *)file :(const char *)function :(NSInteger)line :(id)object, ... {
    va_list args;
    va_start(args, object);
    
    [self log:file :function :line :object :WELogErrorType, args];
    
    va_end(args);
}

- (void)infosLog:(const char *)file :(const char *)function :(NSInteger)line :(id)object, ... {
    va_list args;
    va_start(args, object);
    
    [self log:file :function :line :object :WELogInfosType, args];
    
    va_end(args);
}

@end
