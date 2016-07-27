//
//  DSFeedResidenceCell.m
//  Dormsnap
//
//  Created by Ryan Cohen on 7/14/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import "DSFeedResidenceCell.h"

@implementation DSFeedResidenceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.postBaseView.layer.masksToBounds = YES;
    self.postBaseView.layer.cornerRadius = 2.f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
