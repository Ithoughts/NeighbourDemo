//
//  NeighbourInfo+request.h
//  MyNeighbours
//
//  Created by 臧其龙 on 15/9/21.
//  Copyright (c) 2015年 臧其龙. All rights reserved.
//

#import "NeighbourInfo.h"

typedef void (^requestFinishedCompletionBlock)(id);

@interface NeighbourInfo (request)

+ (void)requestSellerWithCompletion:(requestFinishedCompletionBlock)successBlock;

@end
