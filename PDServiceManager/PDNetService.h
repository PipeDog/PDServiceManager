//
//  PDNetService.h
//  PDServiceManager
//
//  Created by liang on 2020/4/18.
//  Copyright © 2020 liang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PDNetService <NSObject>

- (void)requestSomethingWithCallback:(void (^)(NSDictionary *response))callback;

@end

@interface PDNetService : NSObject <PDNetService>

@end

NS_ASSUME_NONNULL_END
