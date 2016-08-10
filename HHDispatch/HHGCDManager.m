//
//  HHGCDManager.m
//  HHDispatch
//
//  Created by LeAustinHan on 16/8/9.
//  Copyright © 2016年 Han.com. All rights reserved.
//

#import "HHGCDManager.h"

#define MaxCount  10000000

#define NormalCount 100000

@implementation HHGCDManager


//测试串行队列
- (void)testDispatchSer{
    __weak HHGCDManager *instance = self;
     [self  function0];
    dispatch_queue_t myDispatchQueue0 = dispatch_queue_create("com.hanhan.mygcd", NULL);//默认是串行队列
    
    dispatch_async(myDispatchQueue0, ^{
        [instance function1];
    });
    dispatch_async(myDispatchQueue0, ^{
        [instance function2];
    });
    dispatch_async(myDispatchQueue0, ^{
        [instance function3];
    });
    dispatch_async(myDispatchQueue0, ^{
        [instance function4];
    });
    
    [self  function7];

}

//测试并行队列
- (void)testDispatchCon{
    __weak HHGCDManager *instance = self;
    
    dispatch_queue_t myDispatchQueue1 = dispatch_queue_create("com.hanhan.mygcd", DISPATCH_QUEUE_CONCURRENT);//并行队列
    
    [self  function0];
    
    dispatch_async(myDispatchQueue1, ^{
        [instance function1];
    });
    dispatch_async(myDispatchQueue1, ^{
        [instance function2];
    });
    dispatch_async(myDispatchQueue1, ^{
        [instance function3];
    });
    dispatch_async(myDispatchQueue1, ^{
        [instance function4];
    });
    
    [self  function6];
}

//测试多个并行队列
- (void)testMutiDispatchCon{
    __weak HHGCDManager *instance = self;
    
    dispatch_queue_t myDispatchQueue0 = dispatch_queue_create("com.hanhan.mygcd0", DISPATCH_QUEUE_CONCURRENT);//并行队列
    dispatch_queue_t myDispatchQueue1 = dispatch_queue_create("com.hanhan.mygcd1", DISPATCH_QUEUE_CONCURRENT);//并行队列
    dispatch_queue_t myDispatchQueue2 = dispatch_queue_create("com.hanhan.mygcd2", DISPATCH_QUEUE_CONCURRENT);//并行队列
    
    [self  function0];
    
    //*******************队列0********************//
    dispatch_async(myDispatchQueue0, ^{
        [instance  function1];
    });
    
    dispatch_async(myDispatchQueue0, ^{
        [instance  function2];
    });

    dispatch_async(myDispatchQueue0, ^{
        [instance  function3];
    });
    
    //*******************队列1********************//
    dispatch_async(myDispatchQueue1, ^{
        [instance  function4];
    });
    
    dispatch_async(myDispatchQueue1, ^{
        [instance  function5];
    });
    
    //*******************队列2********************//
    dispatch_async(myDispatchQueue2, ^{
        [instance  function6];
    });
    
    [self  function7];
}

- (void)function0{
    NSLog(@"function0");
}

- (void)function1{
    NSLog(@"function1");
    for (int i = 0; i<NormalCount; i++) {
    }
    NSLog(@"function1end");
}

- (void)function2{
    NSLog(@"function2");
    for (int i = 0; i<MaxCount; i++) {
    }
    NSLog(@"function2end");
}

- (void)function3{
    NSLog(@"function3");
    for (int i = 0; i<NormalCount; i++) {
    }
    NSLog(@"function3end");
}

- (void)function4{
    NSLog(@"function4");
    for (int i = 0; i<NormalCount; i++) {
    }
    NSLog(@"function4end");
}

- (void)function5{
    NSLog(@"function5");
    for (int i = 0; i<MaxCount; i++) {
    }
    NSLog(@"function5end");
}

- (void)function6{
    NSLog(@"function6");
    for (int i = 0; i<NormalCount; i++) {
    }
    NSLog(@"function6end");
}

- (void)function7{
    NSLog(@"function7");
}

@end
