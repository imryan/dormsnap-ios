//
//  DSPost.h
//  Dormsnap
//
//  Created by Ryan Cohen on 7/26/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

@class DSUser;
@class DSResidence;

#import <Foundation/Foundation.h>

@interface DSPost : NSObject

@property (nonatomic, readonly) DSUser *user;
@property (nonatomic, readonly) DSResidence *residence;
@property (nonatomic, readonly) NSArray *photos;
@property (nonatomic, readonly) NSString *detail;
@property (nonatomic, readonly) NSUInteger likes;

// @property (nonatomic, readonly) NSArray *tags;

- (instancetype)initWithResidence:(DSResidence *)residence
                             user:(DSUser *)user
                           photos:(NSArray *)photos
                           detail:(NSString *)detail
                            likes:(NSUInteger)likes;

@end
