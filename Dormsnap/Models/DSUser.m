//
//  DSUser.m
//  Dormsnap
//
//  Created by Ryan Cohen on 7/26/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import "DSUser.h"

@interface DSUser ()

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *token;

@end

@implementation DSUser

- (instancetype)initWithIdentifer:(NSString *)identifier token:(NSString *)token {
    self = [super init];
    
    if (self) {
        self.identifier = identifier;
        self.token = token;
    }
    
    return self;
}

@end
