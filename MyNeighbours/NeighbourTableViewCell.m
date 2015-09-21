//
//  NeighbourTableViewCell.m
//  MyNeighbours
//
//  Created by 臧其龙 on 15/9/21.
//  Copyright (c) 2015年 臧其龙. All rights reserved.
//

#import "NeighbourTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "UIView+CornerMaskLayer.h"
#import "UIColor+HexColor.h"
#import "UIScreen+Additions.h"

static CGFloat const kSubViewPadding = 8.0f;
static CGFloat const kAvatarImageWidth = 30.0f;

@interface NeighbourTableViewCell ()
{
    UIImageView *avatarImageView;
    UILabel *hotLabel;
    UILabel *subjectLabel;
    UILabel *timeLabel;
    UILabel *contentLabel;
    UILabel *displayNameLabel;
    UILabel *forumNameLabel;
}

@end

@implementation NeighbourTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI
{
    avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kSubViewPadding, kSubViewPadding, kAvatarImageWidth, kAvatarImageWidth)];
    [avatarImageView addCornerMaskLayerWithRadius:kAvatarImageWidth/2];
    [self.contentView addSubview:avatarImageView];
    
    hotLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    hotLabel.textAlignment = NSTextAlignmentCenter;
    hotLabel.backgroundColor = [UIColor colorWithHex:@"#9CC67C"];
    hotLabel.textColor = [UIColor whiteColor];
    hotLabel.font = FontWithSize(8);
    hotLabel.text = @"推荐";
    hotLabel.hidden = YES;
    [hotLabel sizeToFit];
    hotLabel.center = CGPointMake(CGRectGetMidX(avatarImageView.frame), CGRectGetMaxY(avatarImageView.frame) + kSubViewPadding);
    [self.contentView addSubview:hotLabel];
    
    CGFloat subjectLabelOriginX = CGRectGetMaxX(avatarImageView.frame) + kSubViewPadding;
    subjectLabel = [[UILabel alloc] initWithFrame:CGRectMake(subjectLabelOriginX , CGRectGetMinY(avatarImageView.frame), 0, 0)];
    subjectLabel.numberOfLines = 2;
    subjectLabel.font = [UIFont boldSystemFontOfSize:15];
    [self.contentView addSubview:subjectLabel];
    
    timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    timeLabel.textAlignment = NSTextAlignmentRight;
    timeLabel.font = FontWithSize(12);
    [self.contentView addSubview:timeLabel];
    
    contentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    contentLabel.font = FontWithSize(15);
    contentLabel.numberOfLines = 3;
    [self.contentView addSubview:contentLabel];
    
    displayNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    displayNameLabel.font = FontWithSize(10);
    displayNameLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:displayNameLabel];
    
    forumNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    forumNameLabel.textColor = [UIColor colorWithHex:@"#F2B074"];
    forumNameLabel.font = FontWithSize(10);
    [self.contentView addSubview:forumNameLabel];
    
}

#pragma mark - Bind Data

- (void)bindDataWithNeighbourModel:(NeighbourInfo *)neighbour
{
    [avatarImageView sd_setImageWithURL:neighbour.senderAvatar];
    
    hotLabel.hidden = ![neighbour.hotFlag boolValue];
    
    timeLabel.text = [self tranlateTimestampsToString:[neighbour.sendTime doubleValue]];
    [timeLabel sizeToFit];
    timeLabel.frame = CGRectMake([UIScreen screenWidth] - kSubViewPadding - CGRectGetWidth(timeLabel.frame), CGRectGetMinY(avatarImageView.frame), CGRectGetWidth(timeLabel.frame), CGRectGetHeight(timeLabel.frame));
    

    CGFloat subjectLabelHeight = 15;
    if ([neighbour.subject boundingRectWithSize:CGSizeMake(CGRectGetMinX(timeLabel.frame) - kSubViewPadding, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:15]} context:nil].size.height > 15) {
        subjectLabelHeight = 30;
    }
    subjectLabel.frame = CGRectMake(CGRectGetMaxX(avatarImageView.frame) + kSubViewPadding, CGRectGetMinY(avatarImageView.frame), CGRectGetMinX(timeLabel.frame) - kSubViewPadding, subjectLabelHeight);
    subjectLabel.text = neighbour.subject;
    
    displayNameLabel.frame = CGRectMake(CGRectGetMaxX(avatarImageView.frame) + kSubViewPadding, CGRectGetMaxY(subjectLabel.frame) + kSubViewPadding, 0, 0);
    displayNameLabel.text = neighbour.displayName;
    [displayNameLabel sizeToFit];
    
    forumNameLabel.text = neighbour.forumName;
    [forumNameLabel sizeToFit];
    forumNameLabel.frame = CGRectMake([UIScreen screenWidth] - kSubViewPadding - CGRectGetWidth(forumNameLabel.frame), CGRectGetMaxY(subjectLabel.frame) + kSubViewPadding, CGRectGetWidth(forumNameLabel.frame), CGRectGetHeight(forumNameLabel.frame));
    
    CGFloat contentLabelHeight = 15;
    CGFloat contentLabelWidth = [UIScreen screenWidth] - CGRectGetMinX(subjectLabel.frame) - kSubViewPadding;
    CGFloat contentHeight = [neighbour.content boundingRectWithSize:CGSizeMake(contentLabelWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: FontWithSize(15)} context:nil].size.height ;
    if (contentHeight > 15 && contentHeight < 30) {
        contentLabelHeight = 30;
    }else if(contentHeight > 30){
        contentLabelHeight = 45;
    }
    contentLabel.frame = CGRectMake(CGRectGetMaxX(avatarImageView.frame) + kSubViewPadding, CGRectGetMaxY(displayNameLabel.frame) + kSubViewPadding, contentLabelWidth, contentLabelHeight);
    contentLabel.text = neighbour.content;
    
}

- (void)draw
{
    
}

#pragma mark - Private Method

- (NSString *)tranlateTimestampsToString:(NSTimeInterval)timestamp
{
     NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *currentTimezone = [NSTimeZone systemTimeZone];
    [formatter setTimeZone:currentTimezone];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *sendDate = [NSDate dateWithTimeIntervalSince1970:timestamp/1000];
    
    NSString *result = [formatter stringFromDate:sendDate];
    return result;
}

@end
