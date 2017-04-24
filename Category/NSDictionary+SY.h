//
//  NSDictionary+SY.h
//  YIXun
//
//  Created by yx on 2017/4/24.
//  Copyright © 2017年 www.yixun.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SY)

/**
 替换<null>的键值为@""
 return 替换完成的字典
 */
- (NSDictionary *)sy_dictionaryByReplacingNullsWithStrings;

/**
 合并两个字典
 dict1  NSDictionary
 dict2  NSDictionary
 return 合并后的NSDictionary
 */
+ (NSDictionary *)sy_dictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2;

/**
 加入一个NSDictionary
 
 return 增加后的NSDictionary
 */
- (NSDictionary *)sy_dictionaryByMerging:(NSDictionary *)dict;
@end
