//
//  DSConstants.m
//  Dormsnap
//
//  Created by Ryan Cohen on 6/29/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import <FontAwesomeKit/FontAwesomeKit.h>

#import "DSConstants.h"

@implementation DSConstants

NSString *const DSFontNameExtraLight = @"Raleway-ExtraLight";
NSString *const DSFontNameLight      = @"Raleway-Light";
NSString *const DSFontNameRegular    = @"Raleway-Regular";
NSString *const DSFontNameMedium     = @"Raleway-Medium";
NSString *const DSFontNameSemiBold   = @"Raleway-SemiBold";
NSString *const DSFontNameBold       = @"Raleway-Bold";
NSString *const DSFontNameExtraBold  = @"Raleway-ExtraBold";

#pragma mark - Colors

+ (UIColor *)defaultGreenColor {
    return [UIColor colorWithRed:84/255.f green:217/255.f blue:140/255.f alpha:1.f];
}

+ (UIColor *)defaultGrayColor {
    return [UIColor colorWithRed:182/255.f green:192/255.f blue:210/255.f alpha:0.3f];
}

#pragma mark - Font

+ (UIFont *)navigationBarFont {
    return [UIFont fontWithName:DSFontNameSemiBold size:20.f];
}

+ (UIFont *)defaultFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:DSFontNameRegular size:size];
}

#pragma mark - Icon Strings

+ (NSAttributedString *)postLocationString:(NSString *)location {
    FAKFontAwesome *pinIcon = [FAKFontAwesome mapMarkerIconWithSize:13.f];
    NSString *paddedLocation = [NSString stringWithFormat:@" %@", location];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:pinIcon.attributedString];
    NSAttributedString *universityNameString = [[NSAttributedString alloc] initWithString:paddedLocation];
    
    [attributedString appendAttributedString:universityNameString];
    
    return attributedString;
}

@end