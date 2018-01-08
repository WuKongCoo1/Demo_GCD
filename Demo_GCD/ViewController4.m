//
//  ViewController4.m
//  Demo_GCD
//
//  Created by 吴珂 on 2017/12/27.
//  Copyright © 2017年 世纪阳天. All rights reserved.
//  global示例

#import "ViewController4.h"

@interface ViewController4 ()

@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取系统定义的全局队列 global queue也是并发队列
    //创建时可以指定优先级
    dispatch_queue_t globalQueue = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
    
    //使用方式和并发队列相同
    dispatch_async(globalQueue, ^{
        NSLog(@"task 1 begin");
        dispatch_queue_t serailQueue = dispatch_queue_create("com.wk.serailqueue", DISPATCH_QUEUE_SERIAL);
        dispatch_sync(serailQueue, ^{
            NSLog(@"%@", [NSThread currentThread]);
        });
        
        dispatch_sync(serailQueue, ^{
            NSLog(@"%@", [NSThread currentThread]);
        });
        
        dispatch_sync(serailQueue, ^{
            NSLog(@"%@", [NSThread currentThread]);
        });
        
        dispatch_sync(serailQueue, ^{
            NSLog(@"%@", [NSThread currentThread]);
        });
        sleep(1.f);
        NSLog(@"task 1 end");
    });
    
    dispatch_async(globalQueue, ^{
        NSLog(@"task 2 begin");
        sleep(1.f);
        NSLog(@"task 2 end");
    });
    
    dispatch_async(globalQueue, ^{
        NSLog(@"task 3 begin");
        sleep(1.f);
        NSLog(@"task 3 end");
    });
    
    
    
    dispatch_async(globalQueue, ^{
        NSLog(@"task 4 begin");
        sleep(1.f);
        NSLog(@"task 4 end");
    });
    
    dispatch_async(globalQueue, ^{
        NSLog(@"task 5 begin");
        sleep(1.f);
        NSLog(@"task 5 end");
    });
    
    dispatch_async(globalQueue, ^{
        NSLog(@"task 6 begin");
        sleep(1.f);
        NSLog(@"task 6 end");
    });
    
    dispatch_async(globalQueue, ^{
        NSLog(@"task 7 begin");
        sleep(1.f);
        NSLog(@"task 7 end");
    });
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
