//
//  NeighbourTableViewCell+Height.h
//  MyNeighbours
//
//  Created by 臧其龙 on 15/9/22.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "NeighbourTableViewCell.h"
#import "NeighbourInfo.h"

@interface NeighbourTableViewCell (Height)

- (NSNumber *)calculateCellHeightWithNeighbour:(NeighbourInfo *)info;

@end
