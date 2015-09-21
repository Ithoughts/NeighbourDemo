//
//  Comment.m
//  MyNeighbours
//
//  Created by 臧其龙 on 15/9/21.
//  Copyright (c) 2015年 臧其龙. All rights reserved.
//

#import "Comment.h"

@implementation Comment

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"displayName": @"displayName",
             @"content": @"content",
             };
}

@end
