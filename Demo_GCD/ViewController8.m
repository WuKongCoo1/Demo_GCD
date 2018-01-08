//
//  ViewController8.m
//  Demo_GCD
//
//  Created by 吴珂 on 2017/12/27.
//  Copyright © 2017年 世纪阳天. All rights reserved.
//  dispatch_barrier_sync 栅栏的使用

#import "ViewController8.h"

@interface ViewController8 ()

@end

@implementation ViewController8

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.wk.barroierQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_queue_t globleQueue = dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0);
    
    dispatch_async(globleQueue, ^{
        
        dispatch_async(concurrentQueue, ^{
            NSLog(@"task queue 1 begin");
            sleep(1);
            NSLog(@"task queue 1 end");
        });
        
        dispatch_async(concurrentQueue, ^{
            NSLog(@"task queue 2 begin");
            sleep(1);
            NSLog(@"task queue 2 end");
        });
        
        dispatch_barrier_async(concurrentQueue, ^{
            NSLog(@"dispatch_barrier_sync task 1 begin %@", [NSThread currentThread]);
            sleep(1);
            NSLog(@"dispatch_barrier_sync task 1 end");
        });
        
        dispatch_async(concurrentQueue, ^{
            NSLog(@"task queue 3 begin");
            sleep(1);
            NSLog(@"task queue 3 end");
        });

    });
}

@end
