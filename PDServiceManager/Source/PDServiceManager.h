//
//  PDServiceManager.h
//  PDServiceManager
//
//  Created by liang on 2020/4/17.
//  Copyright © 2020 liang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PDServiceManager <NSObject>

- (void)registerClass:(Class)aClass forType:(Protocol *)aProtocol;
- (void)unregisterClassForType:(Protocol *)aProtocol;

- (void)addService:(id)service forType:(Protocol *)aProtocol;
- (void)removeServiceForType:(Protocol *)aProtocol;

- (nullable id)serviceForType:(Protocol *)aProtocol;

@end

@interface PDServiceManager : NSObject <PDServiceManager>

@property (class, strong, readonly) id<PDServiceManager> defaultManager;

@end

NS_ASSUME_NONNULL_END
