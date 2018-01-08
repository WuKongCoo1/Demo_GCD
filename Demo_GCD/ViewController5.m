//
//  ViewController5.m
//  Demo_GCD
//
//  Created by 吴珂 on 2017/12/27.
//  Copyright © 2017年 世纪阳天. All rights reserved.
//  dispatch_group_t 基本使用

#import "ViewController5.h"

@interface ViewController5 ()

@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建group
    dispatch_group_t group = dispatch_group_create();
    //创建全局队列
    dispatch_queue_t globleQueue = dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0);
    
    //往group中天的要执行的block以及执行的队列
    dispatch_group_async(group, globleQueue, ^{
        NSLog(@"task 1 begin");
        sleep(3.f);
        NSLog(@"task 1 end");
    });
    
    dispatch_group_async(group, globleQueue, ^{
        NSLog(@"task 2 begin");
        sleep(2.f);
        NSLog(@"task 2 end");
    });
    
    dispatch_group_async(group, globleQueue, ^{
        NSLog(@"task 3 begin");
        sleep(1.f);
        NSLog(@"task 3 end");
    });
    
    dispatch_group_async(group, globleQueue, ^{
        NSLog(@"task 4 begin");
        sleep(2.f);
        NSLog(@"task 4 end");
    });
    
    //设置超时时间，会阻塞当前线程，直到block全部执行或者超时
    NSInteger success = dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    //添加任务执行结束处理
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSString *result = success == 0 ? @"task all done" : @"mission failed";
        NSLog(@"%@", result);
    });
}

@end
