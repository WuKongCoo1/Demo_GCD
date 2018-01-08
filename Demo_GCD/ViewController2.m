//
//  ViewController2.m
//  Demo_GCD
//
//  Created by 吴珂 on 2017/12/27.
//  Copyright © 2017年 世纪阳天. All rights reserved.
//  创建并行队列

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.wk.test.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);//并行队列
    NSLog(@"dispatch_async调用concurrent queue=================");
    dispatch_async(concurrentQueue, ^{
        NSLog(@"task 1 begin %@", [NSThread currentThread]);
        sleep(1.f);
        NSLog(@"task 1 end");
    });
    
    dispatch_async(concurrentQueue, ^{
        NSLog(@"task 2 begin %@", [NSThread currentThread]);
        sleep(1.f);
        NSLog(@"task 2 end");
    });
    
    dispatch_async(concurrentQueue, ^{
        NSLog(@"task 3 begin %@", [NSThread currentThread]);
        sleep(1.f);
        NSLog(@"task 3 end");
    });
    
    dispatch_async(concurrentQueue, ^{
        NSLog(@"task 4 begin %@", [NSThread currentThread]);
        sleep(1.f);
        NSLog(@"task 4 end");
    });
    
    dispatch_async(concurrentQueue, ^{
        NSLog(@"task 5 begin %@", [NSThread currentThread]);
        sleep(1.f);
        NSLog(@"task 5 end");
    });
}



@end
