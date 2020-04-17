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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    id<PDLogService> logService = [[PDServiceManager defaultManager] serviceForType:@protocol(PDLogService)];
    [logService log:@"Method `viewDidLoad` run!" level:PDLogLevelVerbose];
}


@end
