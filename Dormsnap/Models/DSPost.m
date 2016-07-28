//
//  DSPost.m
//  Dormsnap
//
//  Created by Ryan Cohen on 7/26/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import "DSPost.h"

@interface DSPost()

@property (nonatomic, strong) DSUser *user;
@property (nonatomic, strong) DSResidence *residence;
@property (nonatomic, strong) NSArray *photos;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, assign) NSUInteger likes;
// @property (nonatomic, strong) NSArray *tags;

@end

@implementation DSPost

- (instancetype)initWithResidence:(DSResidence *)residence
                             user:(DSUser *)user
                           photos:(NSArray *)photos
                           detail:(NSString *)detail
                            likes:(NSUInteger)likes {

    self = [super init];
    
    if (self) {
        self.residence = residence;
        self.user = user;
        self.photos = photos;
        self.detail = detail;
        self.likes = 0;
        
        if (likes > 0) {
            self.likes = likes;
        }
    }
    
    return self;
}

@end
