//
//  PDNetService.m
//  PDServiceManager
//
//  Created by liang on 2020/4/18.
//  Copyright © 2020 liang. All rights reserved.
//

#import "PDNetService.h"

@implementation PDNetService

- (void)requestSomethingWithCallback:(void (^)(NSDictionary * _Nonnull))callback {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSDictionary *response = @{
            @"code": @0,
            @"message": @"success",
            @"data": @{
                @"username": @"pipedog",
                @"passwork": @"12345678",
            },
        };
        !callback ?: callback(response);
    });
}

@end
