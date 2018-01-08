//
//  ViewController3.m
//  Demo_GCD
//
//  Created by 吴珂 on 2017/12/27.
//  Copyright © 2017年 世纪阳天. All rights reserved.
//  同步调用并发队列

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.wk.test.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);//并行队列
    NSLog(@"dispatch_sync调用concurrent quque=================");
    dispatch_sync(concurrentQueue, ^{
        NSLog(@"dispatch_sync task 1 begin %@", [NSThread currentThread]);
        sleep(1.f);
        NSLog(@"dispatch_sync task 1 end");
    });
    
    dispatch_sync(concurrentQueue, ^{
        NSLog(@"dispatch_sync task 2 begin %@", [NSThread currentThread]);
        sleep(1.f);
        NSLog(@"dispatch_sync task 2 end");
    });
    
    dispatch_sync(concurrentQueue, ^{
        NSLog(@"dispatch_sync task 3 begin %@", [NSThread currentThread]);
        sleep(1.f);
        NSLog(@"dispatch_sync task 3 end");
    });
    
    dispatch_sync(concurrentQueue, ^{
        NSLog(@"dispatch_sync task 4 begin %@", [NSThread currentThread]);
        sleep(1.f);
        NSLog(@"dispatch_sync task 4 end");
    });
    
    dispatch_sync(concurrentQueue, ^{
        NSLog(@"dispatch_sync task 5 begin %@", [NSThread currentThread]);
        sleep(1.f);
        NSLog(@"dispatch_sync task 5 end");
    });
}



@end
