//
//  DSUniversity.h
//  Dormsnap
//
//  Created by Ryan Cohen on 7/26/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface DSUniversity : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *address;
@property (nonatomic, readonly) UIColor *color;

- (instancetype)initWithName:(NSString *)name
                     address:(NSString *)address
                    colorHex:(NSString *)colorHex;

@end
