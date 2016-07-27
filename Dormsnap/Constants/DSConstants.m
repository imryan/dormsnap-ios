//
//  DSConstants.m
//  Dormsnap
//
//  Created by Ryan Cohen on 6/29/16.
//  Copyright © 2016 Dormsnap. All rights reserved.
//

#import <FontAwesomeKit/FontAwesomeKit.h>
#import <ChameleonFramework/Chameleon.h>

#import "DSConstants.h"

@implementation DSConstants

NSString * const DS_APP_VERSION      = @"0.1.0";

NSString * const DSFontNameExtraLight = @"Raleway-ExtraLight";
NSString * const DSFontNameLight      = @"Raleway-Light";
NSString * const DSFontNameRegular    = @"Raleway-Regular";
NSString * const DSFontNameMedium     = @"Raleway-Medium";
NSString * const DSFontNameSemiBold   = @"Raleway-SemiBold";
NSString * const DSFontNameBold       = @"Raleway-Bold";
NSString * const DSFontNameExtraBold  = @"Raleway-ExtraBold";

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
    NSString *paddedLocation = [NSString stringWithFormat:@"  %@", location];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:pinIcon.attributedString];
    NSAttributedString *universityNameString = [[NSAttributedString alloc] initWithString:paddedLocation];
    
    [attributedString appendAttributedString:universityNameString];
    
    return attributedString;
}

+ (NSAttributedString *)postLikesString:(NSUInteger)likes {
    FAKIonIcons *heartIcon = [FAKIonIcons heartIconWithSize:12.8f];
    NSString *paddedLocation = [NSString stringWithFormat:@" %lu", likes];
    
    [heartIcon addAttributes:@{ NSForegroundColorAttributeName : [UIColor flatWatermelonColor] }];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:heartIcon.attributedString];
    NSAttributedString *universityNameString = [[NSAttributedString alloc] initWithString:paddedLocation];
    
    [attributedString appendAttributedString:universityNameString];
    
    return attributedString;
}

+ (NSAttributedString *)heartIconString {
    FAKIonIcons *heartIcon = [FAKIonIcons heartIconWithSize:12.8f];
    
    [heartIcon addAttributes:@{ NSForegroundColorAttributeName : [UIColor flatWatermelonColor] }];
    
    return heartIcon.attributedString;
}

#pragma mark - Icon Images

+ (UIImage *)tabBarFeedImage {
    FAKIonIcons *feedIcon = [FAKIonIcons gridIconWithSize:32.f];
    
    [feedIcon addAttributes:@{ NSForegroundColorAttributeName : [UIColor flatWhiteColorDark] }];
    
    return [feedIcon imageWithSize:CGSizeMake(50.f, 50.f)];
}

+ (UIImage *)tabBarCameraImage {
    FAKIonIcons *cameraIcon = [FAKIonIcons cameraIconWithSize:38.f];
    
    [cameraIcon addAttributes:@{ NSForegroundColorAttributeName : [UIColor flatWhiteColorDark] }];
    
    return [cameraIcon imageWithSize:CGSizeMake(50.f, 50.f)];
}

+ (UIImage *)tabBarExploreImage {
    FAKIonIcons *feedIcon = [FAKIonIcons compassIconWithSize:27.f];
    
    [feedIcon addAttributes:@{ NSForegroundColorAttributeName : [UIColor flatWhiteColorDark] }];
    
    return [feedIcon imageWithSize:CGSizeMake(50.f, 50.f)];
}

+ (UIImage *)barButtonSettingsImage {
    FAKIonIcons *gearIcon = [FAKIonIcons iosGearOutlineIconWithSize:28.f];
    
    return [gearIcon imageWithSize:CGSizeMake(25.f, 25.f)];
}

+ (UIImage *)barButtonCancelImage {
    FAKIonIcons *closeIcon = [FAKIonIcons androidCloseIconWithSize:28.f];
    
    return [closeIcon imageWithSize:CGSizeMake(25.f, 25.f)];
}

#pragma mark - Table Cell Images

+ (UIImage *)myPostsCellImage {
    FAKIonIcons *gridIcon = [FAKIonIcons gridIconWithSize:23.f];
    
    [gridIcon addAttributes:@{ NSForegroundColorAttributeName : [UIColor flatBlackColor] }];
    
    return [gridIcon imageWithSize:CGSizeMake(18.f, 30.f)];
}

+ (UIImage *)myLikesCellImage {
    FAKIonIcons *heartIcon = [FAKIonIcons heartIconWithSize:22.f];
    
    [heartIcon addAttributes:@{ NSForegroundColorAttributeName : [UIColor flatWatermelonColor] }];
    
    return [heartIcon imageWithSize:CGSizeMake(18.f, 30.f)];
}

+ (UIImage *)bugCellImage {
    FAKIonIcons *bugIcon = [FAKIonIcons bugIconWithSize:22.f];
    
    [bugIcon addAttributes:@{ NSForegroundColorAttributeName : [UIColor flatBlackColor] }];
    
    return [bugIcon imageWithSize:CGSizeMake(18.f, 30.f)];
}

+ (UIImage *)emailCellImage {
    FAKIonIcons *emailIcon = [FAKIonIcons iosEmailOutlineIconWithSize:22.f];
    
    [emailIcon addAttributes:@{ NSForegroundColorAttributeName : [UIColor flatBlackColor] }];
    
    return [emailIcon imageWithSize:CGSizeMake(18.f, 30.f)];
}

+ (UIImage *)openSourceImage {
    FAKIonIcons *octocatIcon = [FAKIonIcons socialOctocatIconWithSize:22.f];
    
    [octocatIcon addAttributes:@{ NSForegroundColorAttributeName : [UIColor flatBlackColor] }];
    
    return [octocatIcon imageWithSize:CGSizeMake(18.f, 30.f)];
}

@end