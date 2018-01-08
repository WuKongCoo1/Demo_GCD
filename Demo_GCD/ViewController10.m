//
//  ViewController10.m
//  Demo_GCD
//
//  Created by 吴珂 on 2018/1/3.
//  Copyright © 2018年 世纪阳天. All rights reserved.
//

#import "ViewController10.h"

@interface ViewController10 ()

@property (nonatomic, strong) dispatch_source_t source;

@end

@implementation ViewController10

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"dispatch_source_t 实现自定义事件");
    //模拟器第一次执行会有卡顿，真机不会，俺也不知道原因
    __block NSInteger total = 0;
    dispatch_source_t source = dispatch_source_create(DISPATCH_SOURCE_TYPE_DATA_ADD, 0, 0, dispatch_queue_create("com.wk.serialQueue", DISPATCH_QUEUE_CONCURRENT));
    dispatch_source_set_event_handler(source, ^{
        NSInteger result = dispatch_source_get_data(source);
        total += result;
        NSLog(@"total = %li", total);
    });
    
    dispatch_source_set_cancel_handler(source, ^{
        NSLog(@"取消了派发源");
    });
    
    dispatch_resume(source);
    
    self.source = source;
    
    dispatch_queue_t global = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(10);
    
    
    for (int i = 0; i < 100; i++) {
        dispatch_async(global, ^{
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            
            dispatch_source_merge_data(source, 1);
            
            sleep(1.f);
            
            dispatch_semaphore_signal(semaphore);
        });
    }
}

- (void)dealloc
{
    dispatch_source_cancel(self.source);
}



@end
