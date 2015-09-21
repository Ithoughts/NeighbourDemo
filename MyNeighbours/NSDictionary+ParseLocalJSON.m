//
//  NSDictionary+ParseLocalJSON.m
//  MyNeighbours
//
//  Created by 臧其龙 on 15/9/21.
//  Copyright (c) 2015年 臧其龙. All rights reserved.
//

#import "NSDictionary+ParseLocalJSON.h"

@implementation NSDictionary (ParseLocalJSON)

+ (NSDictionary*)dictionaryWithContentsOfJSONString:(NSString*)fileName andFileType:(NSString *)type
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:type];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

@end
