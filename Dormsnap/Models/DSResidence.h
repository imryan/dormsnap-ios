//
//  DSResidence.h
//  Dormsnap
//
//  Created by Ryan Cohen on 7/26/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

@class DSUniversity;

#import <Foundation/Foundation.h>

@interface DSResidence : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *address;
@property (nonatomic, readonly) DSUniversity *university;

- (instancetype)initWithName:(NSString *)name
                     address:(NSString *)address
                  university:(DSUniversity *)university;

@end
