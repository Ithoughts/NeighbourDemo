//
//  Comment.h
//  MyNeighbours
//
//  Created by 臧其龙 on 15/9/21.
//  Copyright (c) 2015年 臧其龙. All rights reserved.
//

#import "MTLModel.h"
#import <MTLJSONAdapter.h>

@interface Comment : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *displayName;
@property (nonatomic, copy, readonly) NSString *content;

@end
