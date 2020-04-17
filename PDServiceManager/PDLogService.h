//
//  PDLogService.h
//  PDServiceManager
//
//  Created by liang on 2020/4/17.
//  Copyright © 2020 liang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, PDLogLevel) {
    PDLogLevelVerbose = 0,
    PDLogLevelDebug,
    PDLogLevelWarning,
    PDLogLevelError,
    PDLogLevelFatal,
};

@protocol PDLogService <NSObject>

- (void)logForLevel:(PDLogLevel)level format:(NSString *)format, ...;

@end

@interface PDLogService : NSObject <PDLogService>

@end

NS_ASSUME_NONNULL_END
