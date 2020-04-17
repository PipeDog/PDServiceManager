//
//  PDLogService.m
//  PDServiceManager
//
//  Created by liang on 2020/4/17.
//  Copyright © 2020 liang. All rights reserved.
//

#import "PDLogService.h"

@implementation PDLogService

- (void)logForLevel:(PDLogLevel)level format:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    NSString *log = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    NSString *prefix = [self prefixForLevel:level];
    if (!prefix) {
        prefix = @"[Unknown]";
    }
    
    NSLog(@"%@ %@", prefix, log);
}

- (NSString *)prefixForLevel:(PDLogLevel)level {
    static NSDictionary *prefixes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        prefixes = @{
            @(PDLogLevelVerbose): @"[Verbose]",
            @(PDLogLevelDebug): @"[Debug]",
            @(PDLogLevelWarning): @"[Warning]",
            @(PDLogLevelError): @"[Error]",
            @(PDLogLevelFatal): @"[Fatal]",
        };
    });
    return prefixes[@(level)];
}

@end
