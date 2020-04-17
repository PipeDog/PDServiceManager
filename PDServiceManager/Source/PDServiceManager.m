//
//  PDServiceManager.m
//  PDServiceManager
//
//  Created by liang on 2020/4/17.
//  Copyright © 2020 liang. All rights reserved.
//

#import "PDServiceManager.h"

#define Lock() dispatch_semaphore_wait(self->_lock, DISPATCH_TIME_FOREVER)
#define Unlock() dispatch_semaphore_signal(self->_lock)

@implementation PDServiceManager {
    NSMutableDictionary<NSString *, id> *_services;
    dispatch_semaphore_t _lock;
}

+ (id<PDServiceManager>)defaultManager {
    static id<PDServiceManager> __defaultManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __defaultManager = [[self alloc] init];
    });
    return __defaultManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _services = [NSMutableDictionary dictionary];
        _lock = dispatch_semaphore_create(1);
    }
    return self;
}

#pragma mark - PDServiceManager
- (void)addService:(id)service forType:(Protocol *)aProtocol {
    if (!service || !aProtocol) { return; }
        
    Lock();
    NSString *serviceType = NSStringFromProtocol(aProtocol);
    _services[serviceType] = service;
    Unlock();
}

- (void)removeServiceForType:(Protocol *)aProtocol {
    if (!aProtocol) { return; }
        
    Lock();
    NSString *serviceType = NSStringFromProtocol(aProtocol);
    _services[serviceType] = nil;
    Unlock();
}

- (id)serviceForType:(Protocol *)aProtocol {
    Lock();
    NSString *serviceType = NSStringFromProtocol(aProtocol);
    id service = _services[serviceType];
    Unlock();
    
    return service;
}

@end
