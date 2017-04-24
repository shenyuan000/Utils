//
//  NSDictionary+SY.m
//  YIXun
//
//  Created by yx on 2017/4/24.
//  Copyright © 2017年 www.yixun.net. All rights reserved.
//

#import "NSDictionary+SY.h"
#import "NSArray+SY.h"

@implementation NSDictionary (SY)
- (NSDictionary *)sy_dictionaryByReplacingNullsWithStrings
{
    const NSMutableDictionary *replaced = [self mutableCopy];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    
    for (NSString *key in self) {
        id object = [self objectForKey:key];
        if (object == nul) {
            [replaced setObject:blank forKey:key];
        }else if ([object isKindOfClass:[NSDictionary class]]){
            [replaced setObject:[object sy_dictionaryByReplacingNullsWithStrings] forKey:key];
        }else if ([object isKindOfClass:[NSArray class]]){
            [replaced setObject:[object sy_arrayByReplacingNullsWithString] forKey:key];
        }
    }
    
    return [NSDictionary dictionaryWithDictionary:[replaced copy]];
}

+ (NSDictionary *)sy_dictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2
{
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithDictionary:dict1];
    NSMutableDictionary *resultTemp = [NSMutableDictionary dictionaryWithDictionary:dict1];
    [resultTemp addEntriesFromDictionary:dict2];
    [resultTemp enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([dict1 objectForKey:key]) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSDictionary *newValue = [[dict1 objectForKey:key] sy_dictionaryByMerging:(NSDictionary *)obj];
                [result setObject:newValue forKey:key];
            }else{
                [result setObject:obj forKey:key];
            }
        }else if ([dict2 objectForKey:key]){
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSDictionary *newValue = [[dict1 objectForKey:key] sy_dictionaryByMerging:(NSDictionary *)obj];
                [result setObject:newValue forKey:key];
            }else{
                [result setObject:obj forKey:key];
            }
        }
    }];
    
    return (NSDictionary *)[result mutableCopy];
}

- (NSDictionary *)sy_dictionaryByMerging:(NSDictionary *)dict
{
    return [[self class] sy_dictionaryByMerging:self with:dict];
}

@end
