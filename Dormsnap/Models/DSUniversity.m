//
//  DSUniversity.m
//  Dormsnap
//
//  Created by Ryan Cohen on 7/26/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

@class DSUniversity;

#import "DSUniversity.h"

@interface DSUniversity ()

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) UIColor *color;

@end

@implementation DSUniversity

#pragma mark - Initialization

- (instancetype)initWithName:(NSString *)name
                     address:(NSString *)address
                    colorHex:(NSString *)colorHex {
    
    self = [super init];
    
    if (self) {
        self.name = name;
        self.address = address;
        self.color = [self colorFromHexString:colorHex];
    }
    
    return self;
}

#pragma mark - Sanitizers

- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    
    // [scanner setScanLocation:1]; // Use this if Phil ends up sending back a leading '#'
    [scanner scanHexInt:&rgbValue];
    
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.f green:((rgbValue & 0xFF00) >> 8)/255.f blue:(rgbValue & 0xFF)/255.f alpha:1.f];
}

@end
