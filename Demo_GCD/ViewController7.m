//
//  ViewController7.m
//  Demo_GCD
//
//  Created by 吴珂 on 2017/12/27.
//  Copyright © 2017年 世纪阳天. All rights reserved.
//  信号量使用

#import "ViewController7.h"

@interface ViewController7 ()

@end

@implementation ViewController7

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //信号量可以用来控制并发操作的最大并发数或者最大的资源访问数，当最大并发数设置为1的时候，就可以让并发操作变成线行操作
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(3);
    
    dispatch_queue_t globleQueue = dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0);
    
    dispatch_async(globleQueue, ^{
        for (int i = 0; i < 10; i++) {
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            //模拟异步操作
            int temp = i;
            dispatch_async(globleQueue, ^{
                NSLog(@"task %i begin", temp);
                sleep(1.f);
                dispatch_semaphore_signal(semaphore);
            });
        }
    });
}

@end
