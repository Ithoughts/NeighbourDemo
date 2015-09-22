//
//  NeighbourInfo.m
//  MyNeighbours
//
//  Created by 臧其龙 on 15/9/21.
//  Copyright (c) 2015年 臧其龙. All rights reserved.
//

#import "NeighbourInfo.h"
#import "ImageResource.h"
#import "NSValueTransformer+MTLPredefinedTransformerAdditions.h"

@implementation NeighbourInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"displayName": @"displayName",
             @"senderAvatar": @"senderAvatar",
             @"sendTime": @"sendTime",
             @"forumName": @"forumName",
             @"content": @"content",
             @"hotFlag": @"hotFlag",
             @"subject": @"subject",
             @"mediaFiles": @"mediaFiles"
             };
}

+ (NSValueTransformer *)hotFlagJSONTransformer{
    
    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:@{
                                                                           @(1): @(YES),
                                                                           @(0): @(NO)
                                                                           }];
}

+ (NSValueTransformer *)senderAvatarJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)mediaFilesJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[ImageResource class]];
}

@end
