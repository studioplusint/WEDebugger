//
//  WELog.h
//  WEDebugger
//
//  Created by Lucas Ortis on 18/03/2016.
//  Copyright © 2016 Lucas Ortis. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, WELogType) {
    WELogDefaultType,
    WELogSuccessType,
    WELogErrorType,
    WELogInfosType,
};

@interface WELog : NSObject

- (instancetype)initWithLog:(NSString *)log type:(WELogType)type;

@property(nonatomic, strong, readonly) NSString *log;
@property(nonatomic, assign, readonly) WELogType type;

@end
