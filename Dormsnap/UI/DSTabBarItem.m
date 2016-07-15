//
//  DSTabBarItem.m
//  Dormsnap
//
//  Created by Ryan Cohen on 7/15/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import "DSTabBarItem.h"

@implementation DSTabBarItem

- (instancetype)initWithImage:(UIImage *)image index:(NSUInteger)index {
    self = [super initWithTitle:nil image:image tag:index];
    
    self.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    return self;
}

@end
