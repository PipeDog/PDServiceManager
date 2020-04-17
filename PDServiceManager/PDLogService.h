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
    PDLogLevelDebug = PDLogLevelVerbose,
    PDLogLevelWarning,
    PDLogLevelError,
};

@protocol PDLogService <NSObject>

- (void)log:(NSString *)format level:(PDLogLevel)level;

@end

@interface PDLogService : NSObject <PDLogService>

@end

NS_ASSUME_NONNULL_END
