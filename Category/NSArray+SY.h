//
//  NSArray+SY.h
//  YIXun
//
//  Created by yx on 2017/4/24.
//  Copyright © 2017年 www.yixun.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SY)
/**
 替换<null>的键值为@""
 return 替换完成的数组
 */
- (NSArray *)sy_arrayByReplacingNullsWithString;

/**
 去除数组内的重复元素
 */
- (NSMutableArray *)sy_removeRepeat;

@end
