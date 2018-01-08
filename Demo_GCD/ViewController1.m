//
//  ViewController1.m
//  Demo_GCD
//
//  Created by 吴珂 on 2017/12/27.
//  Copyright © 2017年 世纪阳天. All rights reserved.
//  串行队列

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSLog(@"串行队列");
    dispatch_queue_t serialQueue = dispatch_queue_create("com.wk.test.serialQueue", DISPATCH_QUEUE_SERIAL);//串行队列
    NSLog(@"dispatch_async 调用 serial quque ===========");
    
    
    dispatch_async(serialQueue, ^{
        NSLog(@"dispatch_async task 1 begin %@", [NSThread currentThread]);
        sleep(1);
        NSLog(@"dispatch_async task 1 end");
    });
    
    dispatch_async(serialQueue, ^{
        NSLog(@"dispatch_async task 2 begin %@", [NSThread currentThread]);
        sleep(1);
        NSLog(@"dispatch_async task 2 end");
    });
    
    dispatch_async(serialQueue, ^{
        NSLog(@"dispatch_async task 3 begin %@", [NSThread currentThread]);
        sleep(1);
        NSLog(@"dispatch_async task 3 end");
    });
    
    dispatch_async(serialQueue, ^{
        NSLog(@"dispatch_async task 4 begin %@", [NSThread currentThread]);
        sleep(1);
        NSLog(@"dispatch_async task 4 end");
    });
    
    dispatch_async(serialQueue, ^{
        NSLog(@"dispatch_async task 5 begin %@", [NSThread currentThread]);
        sleep(1);
        NSLog(@"dispatch_async task 5 end");
    });
    
    
    
    NSLog(@"dispatch_sync 调用 serial quque ===========");
    dispatch_sync(serialQueue, ^{
        NSLog(@"dispatch_sync task 1 begin %@", [NSThread currentThread]);
        sleep(0.1);
        NSLog(@"dispatch_sync task 1 end");
    });
    
    dispatch_sync(serialQueue, ^{
        NSLog(@"dispatch_sync task 2 begin %@", [NSThread currentThread]);
        sleep(0.1);
        NSLog(@"dispatch_sync task 2 end");
    });
    
    dispatch_sync(serialQueue, ^{
        
        NSLog(@"dispatch_sync task 3 begin %@", [NSThread currentThread]);
        sleep(0.1);
        NSLog(@"dispatch_sync task 3 end");
    });
    
    dispatch_sync(serialQueue, ^{
        NSLog(@"dispatch_sync task 4 begin %@", [NSThread currentThread]);
        sleep(0.1);
        NSLog(@"dispatch_sync task 4 end");
    });
    
    dispatch_sync(serialQueue, ^{
        NSLog(@"dispatch_sync task 5 begin %@", [NSThread currentThread]);
        sleep(0.1);
        NSLog(@"dispatch_sync task 5 end");
    });
}


@end
