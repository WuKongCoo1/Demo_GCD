//
//  ViewController9.m
//  Demo_GCD
//
//  Created by 吴珂 on 2018/1/3.
//  Copyright © 2018年 世纪阳天. All rights reserved.
//  dispatchSource timer

#import "ViewController9.h"

@interface ViewController9 ()

@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation ViewController9

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"dispatch_source_t 实现计时器");
    
    __block NSInteger count = 0;
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 2.f * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        NSLog(@"count == %li", count++);
    });
    dispatch_resume(timer);
    
    _timer = timer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
