//
//  DSUser.h
//  Dormsnap
//
//  Created by Ryan Cohen on 7/26/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSUser : NSObject

@property (nonatomic, readonly) NSString *identifier;
@property (nonatomic, readonly) NSString *token;

- (instancetype)initWithIdentifer:(NSString *)identifier token:(NSString *)token;

@end
