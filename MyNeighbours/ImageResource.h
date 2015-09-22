//
//  ImageResource.h
//  MyNeighbours
//
//  Created by 臧其龙 on 15/9/22.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "MTLModel.h"
#import <MTLJSONAdapter.h>

@interface ImageResource : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong, readonly) NSURL *resPath;

@end
