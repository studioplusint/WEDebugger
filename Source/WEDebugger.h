//
//  WEDebugger.h
//  WEDebugger
//
//  Created by Lucas Ortis on 17/03/2016.
//  Copyright © 2016 Lucas Ortis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WELog.h"

#define WELog(...) [[WEDebugger sharedInstance] log:__FILE__ :__PRETTY_FUNCTION__ :__LINE__ :WELogDefaultType :__VA_ARGS__]
#define WEErrorLog(...) [[WEDebugger sharedInstance] log:__FILE__ :__PRETTY_FUNCTION__ :__LINE__ :WELogErrorType :__VA_ARGS__]
#define WESuccessLog(...) [[WEDebugger sharedInstance] log:__FILE__ :__PRETTY_FUNCTION__ :__LINE__ :WELogSuccessType :__VA_ARGS__]
#define WEInfosLog(...) [[WEDebugger sharedInstance] log:__FILE__ :__PRETTY_FUNCTION__ :__LINE__ :WELogInfosType :__VA_ARGS__]

@interface WEDebugger : NSObject

+ (instancetype)sharedInstance;
- (void)log:(const char *)file :(const char *)function :(NSInteger)line :(WELogType)type :(id)object, ...;

@property(nonatomic, strong, readonly) NSMutableArray *logs;
@property(nonatomic, assign, readwrite) BOOL enabled;

@end
