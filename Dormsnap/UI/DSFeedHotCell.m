//
//  DSFeedHotCell.m
//  Dormsnap
//
//  Created by Ryan Cohen on 7/2/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import "DSConstants.h"

#import "DSFeedHotCell.h"

@implementation DSFeedHotCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.postBaseView.layer.masksToBounds = YES;
    self.postBaseView.layer.cornerRadius = 2.f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
