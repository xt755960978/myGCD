//
//  ViewController.m
//  myGCD
//
//  Created by doctor on 14-4-10.
//  Copyright (c) 2014年 doctor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    dispatch_queue_t mySerialDispatchQueue = dispatch_queue_create("com.Yehe.myGCD.mySerialDispatchQueue", NULL);
//    
//    dispatch_queue_t myConcurrentDispatchQueue = dispatch_queue_create("com.Yehe.myGCD.myConcurrentDispatchQueue", DISPATCH_QUEUE_CONCURRENT);
//     
//    //1.异步，串行队列
//    for (int i = 0; i<4; i++) {
//        dispatch_async(mySerialDispatchQueue, ^{//异步，串行队列，block按FIFO执行，只开辟一个子线程
//            for (int j = 0; j<10; j++) {
//                NSLog(@"%@-----%d",[NSThread currentThread],j);
//            }
//        });
//    }
//    //2.异步，并行队列
//    for (int i = 0; i<4; i++) {
//        dispatch_async(myConcurrentDispatchQueue, ^{//异步，并行队列，block并行执行，开辟的线程数由XNU内核决定
//            for (int j = 0; j<10; j++) {
//                NSLog(@"%@-----%d",[NSThread currentThread],j);
//            }
//        });
//    }
    
    
//    //3.同步，并行队列
//    for (int k = 0; k<4; k++) {
//        dispatch_sync(myConcurrentDispatchQueue, ^{//同步，并行队列，其实在mainThread中执行，没有开辟子线程
//            NSLog(@"%@",[NSThread currentThread]);
//        });
//    }
//    
//    //4.同步，串行队列
//    for (int k = 0; k<4; k++) {
//        dispatch_sync(mySerialDispatchQueue, ^{//同步，串行队列，其实在mainThread中执行，没有开辟子线程
//            NSLog(@"%@",[NSThread currentThread]);
//        });
//    }
    
//    //5.优先级
//    dispatch_async(dispatch_get_global_queue(-2, 0), ^{
//        for (int i = 0; i<10; i++) {
//            NSLog(@"priority-2--global---%d---%@",i,[NSThread currentThread]);
//            //sleep(1.0f);
//        }
//    });
//    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        for (int i = 0; i<10; i++) {
//            NSLog(@"priority0--global---%d---%@",i,[NSThread currentThread]);
//            //sleep(1.0f);
//        }
//    });
//    
//    dispatch_async(dispatch_get_global_queue(2, 0), ^{
//        for (int i = 0; i<10; i++) {
//            NSLog(@"priority2---global---%d---%@",i,[NSThread currentThread]);
//            //sleep(1.0f);
//        }
//        
//    });
//    
//    //6.dispatch_after
//    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 3ull*NSEC_PER_SEC);
//    
//    dispatch_after(time, dispatch_get_main_queue(), ^{
//        NSLog(@"waited at least three seconds");
//    });
//    
//    //7.dispatch_group_t
//    dispatch_group_t group = dispatch_group_create();
//    for (int i = 0; i<4; i++) {
//        dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
//            NSLog(@"block%d",i);
//        });
//    }
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        NSLog(@"done");
//    });
//    
//    //8.dispatch_barrier_async
//    __block int count = 10;
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"count0 = %d---",count);
//    });
//    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"count1 = %d",count);
//    });
//    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"count2 = %d",count);
//    });
//    
//    dispatch_barrier_async(dispatch_get_global_queue(0, 0), ^{
//        count = 20;
//    });
//    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"count = %d",count);
//    });
    
    NSLog(@"main-------%@",[NSThread currentThread]);
    
    myThread = [[NSThread alloc]initWithTarget:self selector:@selector(newThread) object:nil];
    [myThread start];
    
}

- (void)newThread
{
    NSLog(@"myThread");
    [self performSelectorOnMainThread:@selector(myMainThread) withObject:nil waitUntilDone:YES];
}

- (void)myMainThread
{
    NSLog(@"-----myMainThread");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
