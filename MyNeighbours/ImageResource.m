//
//  ImageResource.m
//  MyNeighbours
//
//  Created by 臧其龙 on 15/9/22.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "ImageResource.h"
#import "NSValueTransformer+MTLPredefinedTransformerAdditions.h"

@implementation ImageResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"resPath":@"resPath"
             
             };
}

+ (NSValueTransformer *)resPathJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
