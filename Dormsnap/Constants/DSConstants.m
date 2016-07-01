//
//  DSConstants.m
//  Dormsnap
//
//  Created by Ryan Cohen on 6/29/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import "DSConstants.h"
#import <ChameleonFramework/Chameleon.h>

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
    return [UIColor flatGreenColorDark];
}

#pragma mark - Font

+ (UIFont *)navigationBarFont {
    return [UIFont fontWithName:DSFontNameSemiBold size:20.f];
}

+ (UIFont *)defaultFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:DSFontNameRegular size:size];
}

@end