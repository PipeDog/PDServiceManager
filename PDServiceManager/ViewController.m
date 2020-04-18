//
//  ViewController.m
//  PDServiceManager
//
//  Created by liang on 2020/4/17.
//  Copyright © 2020 liang. All rights reserved.
//

#import "ViewController.h"
#import "PDServiceManager.h"
#import "PDLogService.h"
#import "PDNetService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
}

- (void)loadData {
    id<PDLogService> logService = [[PDServiceManager defaultManager] serviceForType:@protocol(PDLogService)];
    [logService logForLevel:PDLogLevelVerbose format:@"Request start"];

    id<PDNetService> netService = [[PDServiceManager defaultManager] serviceForType:@protocol(PDNetService)];
    [netService requestSomethingWithCallback:^(NSDictionary * _Nonnull response) {
        [logService logForLevel:PDLogLevelVerbose format:@"Request finished, response = \n%@", response];
    }];
}

@end
