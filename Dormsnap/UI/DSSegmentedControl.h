//
//  DSSegmentedControl.h
//  Dormsnap
//
//  Created by Ryan Cohen on 7/1/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DSSegmentedControl;

@protocol DSSegmentedControlDelegate <NSObject>

- (void)segmentedControl:(DSSegmentedControl *)filterBar didChangeIndex:(NSUInteger)index;

@end

@interface DSSegmentedControl : UIView <DSSegmentedControlDelegate>

@property (nonatomic, strong) id<DSSegmentedControlDelegate> delegate;

- (void)setupConstraints;

@end
