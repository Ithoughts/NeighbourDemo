//
//  NSDictionary+ParseLocalJSON.h
//  MyNeighbours
//
//  Created by 臧其龙 on 15/9/21.
//  Copyright (c) 2015年 臧其龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ParseLocalJSON)

+ (NSDictionary*)dictionaryWithContentsOfJSONString:(NSString*)fileName andFileType:(NSString *)type;

@end
