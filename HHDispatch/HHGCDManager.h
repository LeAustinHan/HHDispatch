//
//  HHGCDManager.h
//  HHDispatch
//
//  方法中有的是耗时操作（通过for循环实现，请注意循环次数），需要注意方法中的结束打点“functionXend”，体会线程调用顺序和耗时操作对线程的影响

//  Created by LeAustinHan on 16/8/9.
//  Copyright © 2016年 Han.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HHGCDManager : NSObject

//测试串行队列
- (void)testDispatchSer;

//测试并行队列
- (void)testDispatchCon;

//测试多个并行队列
- (void)testMutiDispatchCon;

@end
