//
//  NeighbourTableViewCell.h
//  MyNeighbours
//
//  Created by 臧其龙 on 15/9/21.
//  Copyright (c) 2015年 臧其龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NeighbourInfo.h"

#define FontWithSize(s) [UIFont fontWithName:@"HelveticaNeue-Light" size:s]

@interface NeighbourTableViewCell : UITableViewCell

- (CGFloat)bindDataWithNeighbourModel:(NeighbourInfo *)neighbour;

@end
