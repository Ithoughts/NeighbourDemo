//
//  NeighbourInfo.h
//  MyNeighbours
//
//  Created by 臧其龙 on 15/9/21.
//  Copyright (c) 2015年 臧其龙. All rights reserved.
//

#import "MTLModel.h"
#import <MTLJSONAdapter.h>

@interface NeighbourInfo : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *displayName;
@property (nonatomic, copy, readonly) NSString *subject;
@property (nonatomic, copy, readonly) NSString *content;
@property (nonatomic, copy, readonly) NSString *forumName;
@property (nonatomic, strong, readonly) NSURL *senderAvatar;
@property (nonatomic, strong, readonly) NSNumber *sendTime;
@property (nonatomic, strong, readonly) NSNumber *hotFlag;
@property (nonatomic, strong, readonly) NSNumber *viewNum;
@property (nonatomic, strong, readonly) NSNumber *likesNum;
@property (nonatomic, strong, readonly) NSNumber *commentNum;
@property (nonatomic, strong, readonly) NSArray *mediaFiles;
@property (nonatomic, strong, readonly) NSArray *comments;

@end

