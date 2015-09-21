//
//  NeighbourInfo+request.m
//  MyNeighbours
//
//  Created by 臧其龙 on 15/9/21.
//  Copyright (c) 2015年 臧其龙. All rights reserved.
//

#import "NeighbourInfo+request.h"
#import <AFNetworking.h>

static NSString * const kRequestNeighbourURL = @"http://v2.everhomes.com/m/userMediaTopics";

@implementation NeighbourInfo (request)

+ (void)requestSellerWithCompletion:(requestFinishedCompletionBlock)successBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:kRequestNeighbourURL parameters:@{@"pageCount":@(20), @"id": @(24206938191439894), @"type":@(2), @"pageNum":@(1)}
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"response is%@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

/*
 pageCount": 20,
	"id": 24206938191439894,
	"type": 2,
	"pageNum": 1
 }
 */

@end
