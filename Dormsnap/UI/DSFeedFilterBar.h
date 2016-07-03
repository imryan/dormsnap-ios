//
//  DSFeedFilterBar.h
//  Dormsnap
//
//  Created by Ryan Cohen on 7/1/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DSFeedFilterBar;

@protocol DSFeedFilterBarDelegate <NSObject>

- (void)filterBar:(DSFeedFilterBar *)filterBar didChangeIndex:(NSUInteger)index;

@end

@interface DSFeedFilterBar : UIView <DSFeedFilterBarDelegate>

@property (nonatomic, readonly) NSUInteger currentViewIndex;

@property (nonatomic, strong) id<DSFeedFilterBarDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame;

@end
