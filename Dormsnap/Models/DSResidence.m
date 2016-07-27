//
//  DSResidence.m
//  Dormsnap
//
//  Created by Ryan Cohen on 7/26/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import "DSUniversity.h"
#import "DSResidence.h"

@interface DSResidence()

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) DSUniversity *university;

@end

@implementation DSResidence

- (instancetype)initWithName:(NSString *)name
                     address:(NSString *)address
                  university:(DSUniversity *)university {
    
    self = [super init];
    
    if (self) {
        self.name = name;
        self.address = address;
        self.university = university;
    }
    
    return self;
}

@end
