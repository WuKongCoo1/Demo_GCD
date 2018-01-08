//
//  ViewController6.m
//  Demo_GCD
//
//  Created by 吴珂 on 2017/12/27.
//  Copyright © 2017年 世纪阳天. All rights reserved.
//  dispatch_group_t进阶使用

#import "ViewController6.h"

@interface ViewController6 ()

@end

@implementation ViewController6

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t globleQueue = dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t subGlobleQueue = dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0);
    //模拟网络请求
    dispatch_group_enter(group);
    dispatch_async(globleQueue, ^{
        NSLog(@"task 1 begin");
        dispatch_async(subGlobleQueue, ^{
            sleep(1);
            NSLog(@"task 1 end");
            dispatch_group_leave(group);
        });
    });
    
    dispatch_group_enter(group);
    dispatch_async(globleQueue, ^{
        NSLog(@"task 2 begin");
        dispatch_async(subGlobleQueue, ^{
            sleep(1);
            NSLog(@"task 2 end");
            dispatch_group_leave(group);
        });
    });
    
    dispatch_group_enter(group);
    dispatch_async(globleQueue, ^{
        NSLog(@"task 3 begin");
        dispatch_async(subGlobleQueue, ^{
            sleep(3);
            NSLog(@"task 3 end");
            dispatch_group_leave(group);
        });
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"task all done");
    });
}

@end
