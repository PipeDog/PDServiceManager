//
//  PDLogService.m
//  PDServiceManager
//
//  Created by liang on 2020/4/17.
//  Copyright © 2020 liang. All rights reserved.
//

#import "PDLogService.h"

@implementation PDLogService

- (void)log:(NSString *)format level:(PDLogLevel)level {
    switch (level) {
        case PDLogLevelDebug: { // Verbose
            NSLog(@"[DEBUG] %@", format);
        } break;
        case PDLogLevelWarning: {
            NSLog(@"[WARN] %@", format);
        } break;
        case PDLogLevelError: {
            NSLog(@"[ERROR] %@", format);
        } break;
        default: break;
    }
}

@end
