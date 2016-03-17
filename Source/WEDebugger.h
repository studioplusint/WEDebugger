//
//  WEDebugger.h
//  WEDebugger
//
//  Created by Lucas Ortis on 17/03/2016.
//  Copyright © 2016 Lucas Ortis. All rights reserved.
//

#import <Foundation/Foundation.h>

#define WELog(...) [[WEDebugger sharedInstance] log:__FILE__ :__PRETTY_FUNCTION__ :__LINE__ :__VA_ARGS__]

@interface WEDebugger : NSObject

+ (instancetype)sharedInstance;
- (void)log:(const char *)file :(const char *)function :(NSInteger)line :(id)object, ...;

@property(nonatomic, strong, readonly) NSMutableArray *logs;
@property(nonatomic, assign, readwrite) BOOL enabled;

@end
