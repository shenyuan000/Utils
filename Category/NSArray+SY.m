//
//  NSArray+SY.m
//  YIXun
//
//  Created by yx on 2017/4/24.
//  Copyright © 2017年 www.yixun.net. All rights reserved.
//

#import "NSArray+SY.h"
#import "NSDictionary+SY.h"

@implementation NSArray (SY)
- (NSArray *)sy_arrayByReplacingNullsWithString
{
    NSMutableArray *replaceArr = [self mutableCopy];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    for (int idx = 0; idx < [replaceArr count]; idx++) {
        id object = [replaceArr objectAtIndex:idx];
        if (object == nul) {
            [replaceArr replaceObjectAtIndex:idx withObject:blank];
        }else if ([object isKindOfClass:[NSDictionary class]]){
            [replaceArr replaceObjectAtIndex:idx withObject:[object sy_dictionaryByReplacingNullsWithStrings]];
        }else if ([object isKindOfClass:[NSArray class]]){
            [replaceArr replaceObjectAtIndex:idx withObject:[object sy_arrayByReplacingNullsWithString]];
        }
    }
    return [replaceArr copy];
}

- (NSMutableArray *)sy_removeRepeat
{
    NSMutableArray *repeatArr = [NSMutableArray array];
    for (unsigned i = 0; i < [self count]; i++) {
        if ([repeatArr containsObject:[self objectAtIndex:i]] == NO) {
            [repeatArr addObject:[self objectAtIndex:i]];
        }
    }
    return [repeatArr copy];
}
@end
