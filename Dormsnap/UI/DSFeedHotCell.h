//
//  DSFeedHotCell.h
//  Dormsnap
//
//  Created by Ryan Cohen on 7/2/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSFeedHotCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIView *postBaseView;
@property (nonatomic, weak) IBOutlet UIImageView *postImageView;

@property (nonatomic, weak) IBOutlet UILabel *postTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *postDetailLabel;
@property (nonatomic, weak) IBOutlet UILabel *postLikesLabel;

@end
